require './test/support/test_helper'

class TestParser < MiniTest::Unit::TestCase

  def test_from_path
    assert_equal 'HW9W', MiniTesseract::Parser.new('test/fixtures/HW9W.png').text
  end

  def test_from_image
    image = Magick::Image.read('test/fixtures/HW9W.png').first
    assert_equal 'HW9W', MiniTesseract::Parser.new(image).text
  end

  def test_cropping
    parser = MiniTesseract::Parser.new('test/fixtures/HW9W.png',
                                        x: 145, y: 24, w: 25, h: 28)
    assert_equal '9', parser.text
  end

end