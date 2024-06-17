import PyPDF2


def merge_pdfs(pdf_list, output_path):
    pdf_merger = PyPDF2.PdfMerger()
    for pdf in pdf_list:
        pdf_merger.append(pdf)
    with open(output_path, "wb") as output_file:
        pdf_merger.write(output_file)


if __name__ == "__main__":
    # List of PDF files to merge
    pdfs_to_merge = ["Text.pdf", "Python.pdf"]

    # Output PDF file
    output = "Output.pdf"

    # Call the function to merge the PDFs
    merge_pdfs(pdfs_to_merge, output)

    print(f"PDF files merged into {output}")
