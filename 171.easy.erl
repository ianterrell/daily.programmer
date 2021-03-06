#!/usr/bin/env escript
%%-*- erlang -*-

% Description:
% Today we will be making some simple 8x8 bitmap pictures. You will be given 8 
% hex values that can be 0-255 in decimal value (so 1 byte). Each value 
% represents a row. So 8 rows of 8 bits so a 8x8 bitmap picture.
%
% Input:
% 8 Hex values.
% example:
% 18 3C 7E 7E 18 18 18 18
% Output:
% A 8x8 picture that represents the values you read in.
% For example say you got the hex value FF. This is 1111 1111 . "1" means the 
% bitmap at that location is on and print something. "0" means nothing is 
% printed so put a space. 1111 1111 would output this row:
% xxxxxxxx
% if the next hex value is 81 it would be 1000 0001 in binary and so the 2nd 
% row would output (with the first row)
% xxxxxxxx
% x      x
% Example output based on example input:
%    xx
%   xxxx
%  xxxxxx
%  xxxxxx
%    xx
%    xx
%    xx
%    xx
% Challenge input:
% Here are 4 pictures to process and display:
% FF 81 BD A5 A5 BD 81 FF
% AA 55 AA 55 AA 55 AA 55
% 3E 7F FC F8 F8 FC 7F 3E
% 93 93 93 F3 F3 93 93 93
% Output Character:
% I used "x" but feel free to use any ASCII value you want. Heck if you want to
% display it using graphics, feel free to be creative here.
%
% Retrieved from the r/dailyprogrammer subreddit: 
% http://www.reddit.com/r/dailyprogrammer/comments/2ao99p/7142014_challenge_171_easy_hex_to_8x8_bitmap/
%
% Usage
% cat data/171.easy.input.txt | ./171.easy.erl

% entry point
    main(_) ->
        hex_to_bitmap(io:get_chars('', 8192)).

    hex_to_bitmap([H|T]) ->
        hex_to_bitmap(H),
        hex_to_bitmap(T);
    hex_to_bitmap(C) when C >= $0, C =< $9;
                          C >= $A, C =< $F ->
        print_hex(C);
    hex_to_bitmap(C) when C =:= $\s ->
        io:fwrite("\n");
    hex_to_bitmap(C) when C =:= $\n ->
        io:fwrite("\n\n");
    hex_to_bitmap([]) ->
        init:stop().

    print_hex(C) ->
        Integer = list_to_integer([C], 16),
        BinaryString = io_lib:format("~4.2.0B", [Integer]),
        print_binary(BinaryString).

    print_binary([X|Tail]) ->
      print_binary(X),
      print_binary(Tail);
    print_binary($1) ->
      io:fwrite("X");
    print_binary($0) ->
      io:fwrite(" ");
    print_binary([]) ->
      noop.
