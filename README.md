# MiniTesseract

Mini ruby wrapper around the Tesseract OCR engine.

## Installation

Install the tesseract ocr engine, and imagemagick. On a mac, do:

    brew install tesseract
    brew install imagemagick

Add this line to your application's Gemfile:

    gem 'mini_tesseract'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mini_tesseract

## Usage


    # Parse an image.
    MiniTesseract::Parser.new('my-image').text

    # Specify a page mode (see tesseract documentation).
    MiniTesseract::Parser.new('my-image', psm: 10).text

    # Parse a specific region of the image.
    MiniTesseract::Parser.new('my-big-image',
                              x: 50, y: 50, w: 100, h: 100).text

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Ensure the tests pass (`rake test`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request