// Import Chart.js from the pinned CDN
import Chart from "chart.js/auto";

// Ensure the DOM is fully loaded before running this script
document.addEventListener('DOMContentLoaded', function () {
  // Select the canvas element where the chart will be rendered
  const ctx = document.getElementById('commentsChart').getContext('2d');

  // Use the breedsData variable, which should be defined in the view
  const breeds = breedsData;

  // Map breed names and comment counts for the chart data
  const breedNames = breeds.map(breed => breed.name);
  const commentCounts = breeds.map(breed => breed.comments_count);

  // Create a new bar chart using Chart.js
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: breedNames, // Labels for the x-axis (breed names)
      datasets: [{
        label: 'Number of Comments', // Label for the dataset
        data: commentCounts, // Data for the y-axis (comment counts)
        backgroundColor: 'rgba(75, 192, 192, 0.2)', // Bar color
        borderColor: 'rgba(75, 192, 192, 1)', // Border color
        borderWidth: 1 // Border width for the bars
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true // Ensure the y-axis starts from 0
        }
      }
    }
  });
});
