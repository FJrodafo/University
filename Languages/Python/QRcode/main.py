import qrcode

# URL to be encoded
url = "https://fjrodafo.vercel.app/"

# Create a QRCode object
qr = qrcode.QRCode(
    version=1,
    # error_correction=qrcode.constants.ERROR_CORRECT_H,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=10,
    border=4,
)

# Add the data (in this case, the URL)
qr.add_data(url)
qr.make(fit=True)

# Create an image from the QRCode instance
img = qr.make_image(fill="black", back_color="white")

# Save the generated QR code
img.save("qr_code.png")

# Display the generated QR code
img.show()
