function GL_new = interp_bi(v,w,img_orig)

e_pos = [v,w];
f_pos = [e_pos(1),floor(e_pos(2))];
g_pos = [e_pos(1),ceil(e_pos(2))];
a_value = img_orig(floor(g_pos(1)),g_pos(2));
b_value = img_orig(ceil(g_pos(1)),g_pos(2));
c_value = img_orig(floor(f_pos(1)),f_pos(2));
d_value = img_orig(ceil(f_pos(1)),f_pos(2));
f_value = c_value+(f_pos(1)-floor(f_pos(1)))*(d_value-c_value);
g_value = a_value+(g_pos(1)-floor(g_pos(1)))*(b_value-a_value);
GL_new = f_value+(e_pos(2)-f_pos(2))*(g_value-f_value);
    
end

