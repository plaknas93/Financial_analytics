
# Word Cloud in R (Unstructured Data Analysis)

# Install required packages if not already installed
install.packages(c("pdftools", "tm", "wordcloud", "RColorBrewer"))

# Load required libraries
library(pdftools)       # For extracting text from PDF
library(tm)             # For text mining and preprocessing
library(wordcloud)      # For generating word cloud
library(RColorBrewer)   # For better color palettes

# Step 1: Read the PDF file and extract text
pdf_path = "D:/RWorks/Financial_analytics/Data/Economic_survey_2025.pdf"  

#Replace with the actual path of your PDF
pdf_text_data = pdf_text(pdf_path)  # Extract text from the PDF

# Step 2: Convert extracted text into a single character vector
pdf_text_combined = paste(pdf_text_data, collapse = " ") # Combine all pages into one text block

# Step 3: Create a text corpus
corpus = Corpus(VectorSource(pdf_text_combined))

# Step 4: Text Cleaning and Preprocessing
corpus = tm_map(corpus, content_transformer(tolower)) #Convert text to lowercase
corpus = tm_map(corpus, removePunctuation) # Remove punctuation
corpus = tm_map(corpus, removeNumbers) # Remove numbers
corpus = tm_map(corpus, removeWords, stopwords("english")) # Remove common stopwords
corpus = tm_map(corpus, stripWhitespace) # Remove extra whitespace

# Step 5: Convert text into a Term Document Matrix
tdm = TermDocumentMatrix(corpus)
tdm_matrix = as.matrix(tdm)  #Convert to matrix
word_freqs = sort(rowSums(tdm_matrix), decreasing = TRUE) #Get word frequencies
word_data = data.frame(word = names(word_freqs), freq = word_freqs) #Create data frame

# Step 6: Generate the word cloud
set.seed(1234)  # For reproducibility
wordcloud(words = word_data$word, freq = word_data$freq, min.freq = 5,
          max.words = 50, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))

