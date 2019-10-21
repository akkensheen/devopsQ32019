from die import Die
import pygal

die_1 = Die()
die_2 = Die()

results = []
for roll in range(1000):
    result = die_1.roll() + die_2.roll()
    results.append(result)

print(results)

frequencies = {} # []
for value in range(1, die_1.num_sides + die_2.num_sides + 1):
    frequency = results.count(value)
    frequencies[value] = frequency # frequencies.append(frequency)

print(frequencies)

# Visualise
hist = pygal.Bar()
hist.title = "Rolling 2d6 1000 times"
hist.x_labels = frequencies.keys() # ['1', '2', ...]
hist.x_title = "Result"
hist.y_title = "Frequency of result"
hist.add('2d6', frequencies.values())
hist.render_to_file('2d6_visual.svg')
