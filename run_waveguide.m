% Script to execute the temperature profile codes, generate plots and do
% post processing
% Author : Jaydeep Deshpande 
% Date : March 10, 2016
% Day : Thursday 
%--------------------------------------------------------------------------
                           % DOCUMENTATION % 
%--------------------------------------------------------------------------
% First part of the code will be a few test runs to make sure the code
% works and gives some standard outputs on the screen
% Second - obtain temperature profile for insulated waveguide boundary
% condition
%--------------------------------------------------------------------------
% clear workspace and previous data
clc;
close all;
clear all;
%--------------------------------------------------------------------------
input=initialize_input(); % get input values of all input variables
T=find_temperature_profile_conduction_bc2(input);
T1=find_temperature_profile_conduction(input);
plot(T);
%hold on;
%plot(T1);
%hold on;
