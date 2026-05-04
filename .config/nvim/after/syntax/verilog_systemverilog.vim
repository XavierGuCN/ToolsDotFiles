" Local SystemVerilog highlight refinements layered on top of
" vhda/verilog_systemverilog.vim.

syntax keyword verilogTypeKeyword
      \ bit byte chandle int integer logic longint real realtime reg shortint
      \ shortreal signed string time tri tri0 tri1 triand trior trireg unsigned
      \ uwire var wand wire wor

syntax keyword verilogModuleKeyword
      \ checker clocking config endchecker endclocking endconfig endinterface
      \ endmodule endpackage endprimitive endprogram endtable interface
      \ macromodule module package primitive program table

syntax keyword verilogBlockKeyword
      \ always always_comb always_ff always_latch begin disable do end final
      \ forever fork initial join join_any join_none repeat return wait while

syntax keyword verilogFlowKeyword
      \ break case casex casez continue default else endcase for foreach if iff
      \ priority unique unique0

syntax keyword verilogPortKeyword
      \ alias assign deassign defparam force import incdir include inout input
      \ instance liblist library modport output ref release use

syntax keyword verilogParamKeyword
      \ automatic const context extern genvar local localparam parameter pure
      \ specparam static virtual

syntax keyword verilogClassKeyword
      \ class endclass extends implements new null protected super tagged this
      \ type typedef union

syntax keyword verilogEnumStructKeyword
      \ enum packed struct

syntax keyword verilogRandomKeyword
      \ constraint dist get_randstate inside rand randc randcase randomize
      \ randsequence set_randstate solve srandom soft std with

syntax keyword verilogAssertKeyword
      \ accept_on assert assume before bind bins binsof cover covergroup
      \ coverpoint cross endgroup endproperty endsequence expect first_match
      \ global illegal_bins ignore_bins intersect let matches nexttime property
      \ reject_on restrict s_always s_eventually s_nexttime s_until
      \ s_until_with sequence strong sync_accept_on sync_reject_on throughout
      \ triggered until until_with wait_order weak wildcard within

syntax keyword verilogDriveKeyword
      \ and buf bufif0 bufif1 cell cmos edge highz0 highz1 ifnone large medium
      \ nand negedge nmos nor noshowcancelled not notif0 notif1 or pmos posedge
      \ pull0 pull1 pulldown pullup pulsestyle_ondetect pulsestyle_onevent
      \ rcmos rnmos rpmos rtran rtranif0 rtranif1 scalared showcancelled small
      \ strong0 strong1 supply0 supply1 tran tranif0 tranif1 vectored weak0
      \ weak1 xnor xor

highlight default link verilogTypeKeyword Type
highlight default link verilogModuleKeyword Structure
highlight default link verilogBlockKeyword Statement
highlight default link verilogFlowKeyword Conditional
highlight default link verilogPortKeyword Identifier
highlight default link verilogParamKeyword StorageClass
highlight default link verilogClassKeyword Type
highlight default link verilogEnumStructKeyword Structure
highlight default link verilogRandomKeyword Special
highlight default link verilogAssertKeyword PreProc
highlight default link verilogDriveKeyword Operator
