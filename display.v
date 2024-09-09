module display(clk,rst,r,g,b,clk_25mhz,blk,sync,ov_sync,oh_sync);
input clk,rst;
output wire ov_sync,oh_sync;
output reg [7:0]r,g,b;
output blk,sync;
output wire clk_25mhz;
assign blk=1;
assign sync=1;

reg [1:0]cnt=2'b00;
reg clk_25mhz_temp;

always@(posedge (clk) or posedge (rst))
begin
if(rst)
begin
cnt=0;
clk_25mhz_temp=1'b0;
end

else cnt=cnt+1;
clk_25mhz_temp=cnt[0];
end
assign clk_25mhz=clk_25mhz_temp;

parameter tot_width=800;
parameter tot_height=525;
parameter h_pulse=92;
parameter h_fp=784;
parameter h_bp=144;
parameter v_pulse=2;
parameter v_fp=511;
parameter v_bp=31;

reg [9:0]h_reg,v_reg;

always@(posedge (clk_25mhz) or posedge (rst))
begin
if(rst)
begin
h_reg<=0;
v_reg<=0;
end

else
begin
if(h_reg<tot_width-1) h_reg<=h_reg+1;
else
begin
h_reg<=0;
if(v_reg<tot_height-1) v_reg<=v_reg+1;
else v_reg<=0;
end
end
end

assign oh_sync=(h_reg<h_pulse)?0:1;
assign ov_sync=(v_reg<v_pulse)?0:1;

always@(posedge (clk_25mhz) or posedge(rst))
begin
if(rst)
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end

else
begin
if(h_reg>=(h_bp+5) && h_reg<(h_bp+18))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+18) && h_reg<(h_bp+48))
begin
if((v_reg>=(v_bp+160) && v_reg<(v_bp+173)) | (v_reg>=(v_bp+198)) && (v_reg<(v_bp+211)))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

///////////////letter h//////////////

else if(h_reg>=(h_bp+53) && h_reg<(h_bp+66))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+66) && h_reg<(h_bp+96))
begin
if(v_reg>=(v_bp+185) && v_reg<(v_bp+198))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+96) && h_reg<(h_bp+109))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

/////////////letter a ///////////

else if(h_reg>=(h_bp+119) && h_reg<(h_bp+132))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+132) && h_reg<(h_bp+162))
begin
if((v_reg>=(v_bp+160) && v_reg<(v_bp+173)) | (v_reg>=(v_bp+185)) && (v_reg<(v_bp+198)))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+162) && h_reg<(h_bp+175))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

//////////// letter n ////////
else if(h_reg>=(h_bp+185) && h_reg<(h_bp+198))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+185) && h_reg<(h_bp+198))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+198) && h_reg<(h_bp+228))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+173))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+228) && h_reg<(h_bp+241))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

///////////// letter d ////////////
else if(h_reg>=(h_bp+251) && h_reg<(h_bp+264))
begin
if((v_reg>=(v_bp+160) && v_reg<(v_bp+173)) | (v_reg>=(v_bp+198) && v_reg<(v_bp+211)))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+264) && h_reg<(h_bp+277))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+277) && h_reg<(h_bp+307))
begin
if((v_reg>=(v_bp+160) && v_reg<(v_bp+173)) | (v_reg>=(v_bp+198) && v_reg<(v_bp+211)))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+307) && h_reg<(h_bp+320))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

/////////// letter r /////////

else if(h_reg>=(h_bp+330) && h_reg<(h_bp+343))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+343) && h_reg<(h_bp+373))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+173))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

//////// letter u///////

else if(h_reg>=(h_bp+383) && h_reg<(h_bp+396))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+396) && h_reg<(h_bp+426))
begin
if(v_reg>=(v_bp+198) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

else if(h_reg>=(h_bp+426) && h_reg<(h_bp+439))
begin
if(v_reg>=(v_bp+160) && v_reg<(v_bp+211))
begin
r=8'b11111111;
g=8'b00000000;
b=8'b00000000;
end

else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end


else
begin
r=8'b00000000;
g=8'b00000000;
b=8'b00000000;
end
end

end
endmodule