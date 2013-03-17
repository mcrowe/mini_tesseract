module MiniTesseract
  class Parser

    def initialize(path_or_image, options = {})
      @psm = options.delete(:psm) || 7
      @x = options.delete(:x)
      @y = options.delete(:y)
      @w = options.delete(:w)
      @h = options.delete(:h)

      @config = options.map { |k, v| "#{k} #{v}" }.join("\n")

      @image = if path_or_image.kind_of?(Magick::Image)
        path_or_image.clone
      else
        Magick::Image.read(path_or_image).first
      end
    end

    def text
      @text ||= parse_text
    end

    private

      def image_to_tiff
        crop_image

        tmp_file = Pathname.new(Dir::tmpdir).join("#{unique_id}.tif").to_s
        @image.write(tmp_file)

        tmp_file
      end

      def crop_image
        @image.crop!(@x, @y, @w, @h) unless [@x, @y, @w, @h].any?(&:nil?)
      end

      def psm_option
        @psm ? " -psm #{@psm}" : ""
      end

      def config_file
        return "" if @config == {}
        conf = Tempfile.new("config")
        conf.write(@config)
        conf.flush
        conf.path
      end

      def parse_text
        tmp_file  = Pathname.new(Dir::tmpdir).join(unique_id)
        tmp_image = image_to_tiff
        `tesseract "#{tmp_image}" "#{tmp_file.to_s}" #{psm_option} #{config_file} 2>/dev/null`
        text = File.read("#{tmp_file.to_s}.txt").strip
        remove_files([tmp_image,"#{tmp_file.to_s}.txt"])

        text
      end

      def remove_files(files=[])
        files.each do |file|
          begin
            File.unlink(file) if File.exist?(file)
          rescue
            system "rm -f #{file}"
          end
        end
      end

      def unique_id
        SecureRandom.urlsafe_base64
      end

  end
end