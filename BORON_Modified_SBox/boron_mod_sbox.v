module boronSbox (x3, x2, x1, x0, y3, y2, y1, y0); 
input x3, x2, x1, x0;
output y3, y2, y1, y0;
wire n0, n1, n2, n3, a,b,c,d,e,f,g,h,i,j, t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15, or1, or2, or3, 
or4, or5, or6, or7, or8, or9, or10, or11, or12, or13, w1, w2, w3, w4, w5, w6; 

not (n3, x3);
not (n2, x2);
not (n1, x1);
not (n0, x0);

///////Assigning varaiables/////////////

and (h, n3, n2); ////////////hhhhhhhhhh///////////
and (g, x1, x0); //////////ggggggggg////////
and (i, n3, x2);///////////iiiiiiiiii/////
and (d, n1, n0);///////////////ddddddd//////
and (e, x2,x0); ////////eeeeeeeee///////////
and (w1, n2, n1);
and (j, w1, n0);
and (w2, x3, x2);
and (f, w2, x1);
and (a, h, n0);
and (b, d, n3);
and (w3, x3, x1);
and (c, w3, x0);


///////////y0//////////

and (t1, h, x1);
and (t2, n2, g);
and (t3, i, n1);
and (w4, x2, n1);
and (t4, w4, x0);
and (t5, x3, j);
and (t6, f, n0);
or (or1, t1, t2);
or (or2, or1, t3);
or (or3, or2, t4);
or (or4, or3, t5);
or (y0, or4, t6);


/////////////////y1////////////

and (t7, x2, g);
and (w5, x3, n2);
and (t8, w5, x0);
or (or5, a, b);
or (or6, or5, t7);
or (or7, or6, t8);
or (y1, or7, f);


//////////////////////y2//////////////

and (t9, h, n1);
and (t10, i, n0);
and (t11, x3, e);
or (or8, t9, j);
or (or9, or8, t10);
or (or10, or9, c);
or (y2, or10, t11);

/////////////////y3///////////////

and (t12, n3, e);
and (t13, x3, d);
and (t14, c, n2);
and (w6, n3, x1);
and (t15, w6, n0);
or (or11, a, t15);
or (or12, or11, t12);
or (or13, or12, t13);
or (y3, or13, t14);

endmodule


