
#Sentiment Analysis in R

# Step 1: Define the path to the PDF file
pdf_path = "D:/RWorks/Financial_analytics/Data/Economic_survey_2025.pdf"    # Update with your file location

# Step 2: Install necessary packages
##install.packages("syuzhet")   # For sentiment analysis

# Step 3: Load required libraries
library(pdftools)
library(syuzhet)

# Step 4: Define a function to analyze sentiment from a PDF file
analyze_pdf_sentiment = function(pdf_path) {
  
  # Step 4.1: Extract text from the PDF file
  text = pdf_text(pdf_path)  # Extract text from all pages
  text = paste(text, collapse = " ")  # Combine all pages into one continuous string
  
  # Step 4.2: Perform sentiment analysis using NRC lexicon
  sentiment_scores = get_nrc_sentiment(text)
  
  # Step 4.3: Summarize the sentiment scores by summing across all words
  sentiment_summary = colSums(sentiment_scores)
  
  # Step 4.4: Print the summarized sentiment scores
  print(sentiment_summary)
  
  # Step 4.5: Plot the sentiment scores for visualization
  barplot(sentiment_summary, 
          col = rainbow(length(sentiment_summary)),
          main = "Sentiment Analysis of PDF Content",
          las = 2)  # Rotate axis labels for better readability
  
  # Step 4.6: Return the sentiment summary as output
  return(sentiment_summary)
}

# Step 5: Run the sentiment analysis function
sentiment_results = analyze_pdf_sentiment(pdf_path)

