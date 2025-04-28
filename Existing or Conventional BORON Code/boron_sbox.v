module boron_gate (x3, x2, x1, x0, y3, y2, y1, y0); 
input x3, x2, x1, x0;
output y3, y2, y1, y0;
wire n0, n1, n2, n3, a,b,c,d,e,f,g,h,i,j, t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16, t17, t18;
wire t19, t20, t21, t22, t23, t24, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17; 
wire q18, q19, q20, q21, or1, or2, or3, or4, or5, or6, or7, or8, or9, or10, or11, or12, or13 ; 

not (n3, x3);
not (n2, x2);
not (n1, x1);
not (n0, x0);

///////////y0//////////
and (t1, n3, n2);
and (q1, t1, x1);
and (t2, n2, x1);
and (q2, t2, x0); 
and (t3, n3, x2);
and (q3, t3, n1);
and (t4, x2, n1);
and (q4, t4, x0);
and (t5, x3, n2);
and (t6, t5, n1);
and (q5, t6, n0);
and (t7, x3, x2);
and (t8, t7, x1);
and (q6, t8, n0);
or (or1, q1, q2);
or (or2, or1, q3);
or (or3, or2, q4);
or (or4, or3, q5);
or (y0, or4, q6);


/////////////////y1////////////

and (t9, n3, n2);
and (q7, t9, n0);
and (t10, n3, n1);
and (q8, t10, n0);
and (t11, x2, x1);
and (q9, t11, x0);
and (t12, x3, n2);
and (q10, t12, x0);
and (t13, x3, x2);
and (q11, t13, x1);
or (or5, q7, q8);
or (or6, or5, q9);
or (or7, or6, q10);
or (y1, or7, q11);


//////////////////////y2//////////////

and (t14, n3, n2);
and (q12, t14, n1);
and (t15, n2, n1);
and (q13, t15, n0);
and (t16, n3, x2);
and (q14, t16, n0);
and (t17, x3, x1);
and (q15, t17, x0);
and (t18, x3, x2);
and (q16, t18, x0);
or (or8, q12, q13);
or (or9, or8, q14);
or (or10, or9, q15);
or (y2, or10, q16);

/////////////////y3///////////////

and (t19, n3, n2);
and (q17, t19, n0);
and (t20, n3, x1);
and (q18, t20, n0);
and (t21, n3, x2);
and (q19, t21, x0);
and (t22, x3, n1);
and (q20, t22, n0);
and (t23, x3, n2);
and (t24, t23, x1);
and (q21, t24, x0);
or (or11, q17, q18);
or (or12, or11, q19);
or (or13, or12, q20);
or (y3, or13, q21);

endmodule

