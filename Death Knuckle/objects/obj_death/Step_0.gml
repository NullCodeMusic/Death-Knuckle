


wspd = abs(w-576)/spd
hspd = abs(h-324)/spd

w=w-wspd
h=h-hspd


camera_set_view_size(view_camera[0],w,h)

x= camera_get_view_width(view_camera[0])/2
y= camera_get_view_height(view_camera[0])/2