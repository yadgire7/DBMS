
# import libraries
import math

# define variables
beginning = """<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
<Placemark>
<name>Tommy-Trojan-Spirograph</name>
<LineString>
<coordinates>"""

end = """</coordinates>
</LineString>
<Style>
<LineStyle>
<color>#ffffff00</color>
<width>4</width>
</LineStyle>
</Style>   
</Placemark>
</Document>
</kml>"""

# given values for R, r, a
t = 0.00
R = 6.0/10000
r = 1.0/10000
a = 8.0/10000

with open("tommy_trojan_spirograph.kml", 'w') as f:
    f.write(beginning)
    while t < 16*math.pi:
        coords = ""
        x = (R + r) * math.cos((r / R) * t) - a * \
            math.cos((1 + r / R) * t) - 118.285463
        y = (R + r) * math.sin((r / R) * t) - a * \
            math.sin((1 + r / R) * t) + 34.020528
        coords += str(x) + ',' + str(y) + ",0.\n"
        f.write(coords)
        t += 0.01
    f.write(end)
