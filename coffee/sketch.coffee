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
	line X+S*x1, Y+S*y1, X+S*x2, Y+S*y2

r = (x1,y1,x2,y2) ->
	rect X+S*x1, Y+S*y1, X+S*x2, Y+S*y2

vertical = (x,y) ->
	r x-3,y,   x+3,y+5
	l x,    y+5, x,    y+38
	r x-3,y+38,x+3,y+44

	for i in range 11
		l x-10+2,9+i*3-1.5,   x-7.5+2,10.5+i*3-1.5
		l x-10+2,9+i*3-1.5,   x-7.5+2, 7.5+i*3-1.5

	for i in range 11
		l x+10-2, 9+i*3-1.5, x+7.5-2, 10.5+i*3-1.5
		l x+10-2, 9+i*3-1.5, x+7.5-2,  7.5+i*3-1.5

setup = ->
	createCanvas 1200,700
	strokeWeight 1
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
	r x-3,yf, x+3,yg
	push()
	strokeWeight 3
	l x,y, x-7.5,yi
	l x,y, x+7.5,yi
	pop()

draw_y = ->
	X = 20
	Y = 550
	r xa,yg,xz,yh
	horizontal xd,ye
	horizontal xf,ye
	horizontal xg,ye

draw_x = ->
	X = 100
	Y = ya+20
	r xz+3,ya,xz+4,yb
	r xz+4,ya,xz+5,yb
	r xz+3,yc,xz+4,yd
	r xz+4,yc,xz+5,yd

	l xz,yb,xz+10-3,yb
	l xz,yc,xz+10-3,yc
	l xz,yb,xz,yc

	for i in range 11
		l xz+12-3, 9+i*3-1.5,   xz+10-3, 10.5+i*3-1.5
		l xz+12-3, 9+i*3-1.5,   xz+10-3,  7.5+i*3-1.5

draw = ->
	background 255

	draw_z()
	draw_y()
	draw_x()
