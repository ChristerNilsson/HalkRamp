echo = console.log
range = _.range

S = 10
X = 0
Y = 0

xa = 0
xb = 7.5
xc = 12.5
xd = 15
xe = 17.5
xf = 50
xg = 85

xz = 100

ya = 1
yb = 6
yc = 39
yd = 45

ye = 0
yf = 4
yg = 5
yh = 6
yi = 10

l = (x1,y1,x2,y2) ->
	strokeWeight 1
	line X + S*x1, Y + S*y1, X + S*x2, Y + S*y2

l3 = (x1,y1,x2,y2) ->
	strokeWeight 3
	line X + S*x1, Y + S*y1, X + S*x2, Y + S*y2

r = (x1,y1,x2,y2) ->
	strokeWeight 1
	rect X + S*x1, Y + S*y1, X + S*x2, Y + S*y2

vertical = (x,y) ->
	r x - 3, y,      x + 3, y + 5
	l x,     y + 5,  x,     y+38
	r x - 3, y + 38, x + 3, y+44

	for i in range 11
		l x - 8, 7.5 + i*3,   x - 5.5, 9 + i*3
		l x - 8, 7.5 + i*3,   x - 5.5, 6 + i*3

	for i in range 11
		l x + 8, 7.5 + i*3, x + 5.5, 9 + i*3
		l x + 8, 7.5 + i*3, x + 5.5, 6 + i*3

setup = ->
	createCanvas 1200,700
	strokeWeight 0.5
	noFill()
	rectMode CORNERS

draw_z = ->
	X = 20
	Y = 20
	r xa,ya,xz,yb
	r xa,yc,xz,yd

	vertical xd,ya
	vertical xf,ya
	vertical xg,ya

horizontal = (x,y) ->
	r x - 2.7, yf, x + 2.7, yg
	l3 x, y, x - 7.5, yi
	l3 x, y, x + 7.5, yi
	l3 x - 4.5, yh + 0.2, x + 4.5, yh + 0.2

draw_y = ->
	X = 20
	Y = 550
	horizontal xd,ye
	horizontal xf,ye
	horizontal xg,ye
	push()
	fill 'white'
	r xa,yg,xz,yh
	pop()

draw_x = ->
	X = 100
	Y = ya + 20

	l3 xz + 5, ya, xz + 5, yb
	l3 xz + 5, yc, xz + 5, yd

	r xz + 3, ya, xz + 4, yb
	r xz + 3, yc, xz + 4, yd

	r xz + 4, ya, xz + 5, yb
	r xz + 4, yc, xz + 5, yd

	l xz, yb, xz + 7, yb
	l xz, yc, xz + 7, yc
	l xz, yb, xz,     yc

	for i in range 11
		l xz + 9, 7.5 + i*3, xz + 7, 9 + i*3
		l xz + 9, 7.5 + i*3, xz + 7, 6 + i*3

draw = ->
	background 255

	draw_z()
	draw_y()
	draw_x()

	push()
	fill 'black'
	textSize 20
	text '1.0', S*(xz+13), 550 + S*yg
	pop()