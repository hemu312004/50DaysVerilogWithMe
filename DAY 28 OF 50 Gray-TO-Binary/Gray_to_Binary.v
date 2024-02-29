module gray_to_binary
        (input [3:0] G, //gray code output
         output [3:0] bin   //binary input
        );

assign bin[3] = G[3];
assign bin[2] = G[3] ^ G[2];
assign bin[1] = G[3] ^ G[2] ^ G[1];
assign bin[0] = G[3] ^ G[2] ^ G[1] ^ G[0];

endmodule