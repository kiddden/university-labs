import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter

# Read the data set
data = pd.read_excel('dataset.xlsx')

# Group by station and calculate the mean price
mean_prices_by_station = data.groupby('Station')['Price'].mean().reset_index()

# Print the table
print(mean_prices_by_station)

# Create a graph showing the dependence of price on the station
fig, ax = plt.subplots(figsize=(10, 6))

# Sort stations by mean price
mean_prices_by_station_sorted = mean_prices_by_station.sort_values('Price')
station_labels = mean_prices_by_station_sorted['Station'].tolist()
mean_prices = mean_prices_by_station_sorted['Price'].tolist()

# Plot mean prices
x = range(len(station_labels))
ax.plot(x, mean_prices, 'o', label='Average Prices')

# Set axis labels, title, and x-axis tick labels
ax.set_xticks(x)
ax.set_xticklabels(station_labels, rotation=90)
ax.set_xlabel('Station')
ax.set_ylabel('Price')
ax.set_title('Real Estate Prices in Kyiv')

# Format y-axis tick labels as integers
def y_fmt(x, pos):
    return '{:,.0f}'.format(x)
ax.yaxis.set_major_formatter(FuncFormatter(y_fmt))

plt.show()