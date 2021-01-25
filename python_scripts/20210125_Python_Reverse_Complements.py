#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 25 14:02:54 2021
Find the complementary DNA strand
@author: jluo
"""

# Exercise 1 Write a function to return the complement of a DNA sequence

def complementarynucleotide (nucleotide):
    #Input is base A, T, C, or G
    #Output is base T, A, G, or C
    output = None
    #print (nucleotide)
    if nucleotide == 'A':
        output = 'T'
    elif nucleotide == 'T':
        output = 'A'
    elif nucleotide == 'C':
        output = 'G'
    elif nucleotide == 'G':
        output = 'C'
    else:
        output = '*'
    
    # print (output)
    return (output)


# This is expecting on individual necleotide, not a sequence


# to do a sequence
seqence = input("Input your DNA sequence: ")

def complementaryDNAstrand (strand):
    # print (strand)
    complementstrand = ""
    for n in strand:
        x = complementarynucleotide(n)
        # += means complementstrand = complementstrand + x
        complementstrand += x
    print ("This is the complementary strand: ", complementstrand)
    return (complementstrand)
    
complement_seq = complementaryDNAstrand(seqence)


# Exercise 2 Write a function to reverse a string
def reverse_strand (n):
    print ("This is the reverse complementary strand: ", n[::-1])
    return n[::-1]

reverse_strand(complement_seq)