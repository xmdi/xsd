addpath('src');	% libs

close all
clear all
clc

global section
section=initSection(0,0,0,0);
hollowWingSection(12,.01*12,.2,.4,.65);
drawSection;
