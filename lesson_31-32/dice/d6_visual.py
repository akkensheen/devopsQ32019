from die import Die
import pygal

die = Die()

results = []
for roll in range(1000):
    result = die.roll()
    results.append(result)

print(results)

frequencies = {}
for value in range(1, die.num_sides+1):
    frequency = results.count(value)
    frequencies[value] = frequency

print(frequencies)

# Visualise
hist = pygal.Bar()
hist.title = "Rolling d6 1000 times"
hist.x_labels = frequencies.keys()
hist.x_title = "Result"
hist.y_title = "Frequency of result"
hist.add('d6', frequencies.values())
hist.render_to_file('die_visual.svg')
