function pdf2png -a input_pdf output_img -d "convert a pdf to a high quality image"
    magick \
        -verbose \
        -density 150 \
        $input_pdf \
        -trim \
        -quality 100 \
        -flatten \
        -sharpen 0x1.0 \
        $output_img
end
