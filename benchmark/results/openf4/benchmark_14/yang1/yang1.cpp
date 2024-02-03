// yang1
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <libopenf4.h>
using namespace std;

int main (int argc, char **argv)
{

	vector<string> polynomialArray;
	vector<string> variableName;

	variableName.push_back("x1");
	variableName.push_back("x2");
	variableName.push_back("x3");
	variableName.push_back("x4");
	variableName.push_back("x5");
	variableName.push_back("x6");
	variableName.push_back("x7");
	variableName.push_back("x8");
	variableName.push_back("x9");
	variableName.push_back("x10");
	variableName.push_back("x11");
	variableName.push_back("x12");
	variableName.push_back("x13");
	variableName.push_back("x14");
	variableName.push_back("x15");
	variableName.push_back("x16");
	variableName.push_back("x17");
	variableName.push_back("x18");
	variableName.push_back("x19");
	variableName.push_back("x20");
	variableName.push_back("x21");
	variableName.push_back("x22");
	variableName.push_back("x23");
	variableName.push_back("x24");
	variableName.push_back("x25");
	variableName.push_back("x26");
	variableName.push_back("x27");
	variableName.push_back("x28");
	variableName.push_back("x29");
	variableName.push_back("x30");
	variableName.push_back("x31");
	variableName.push_back("x32");
	variableName.push_back("x33");
	variableName.push_back("x34");
	variableName.push_back("x35");
	variableName.push_back("x36");
	variableName.push_back("x37");
	variableName.push_back("x38");
	variableName.push_back("x39");
	variableName.push_back("x40");
	variableName.push_back("x41");
	variableName.push_back("x42");
	variableName.push_back("x43");
	variableName.push_back("x44");
	variableName.push_back("x45");
	variableName.push_back("x46");
	variableName.push_back("x47");
	variableName.push_back("x48");
	polynomialArray.emplace_back("x21*x45 + x22*x46 + x23*x47 + x24*x48");
	polynomialArray.emplace_back("x17*x45 + x18*x46 + x19*x47 + x20*x48");
	polynomialArray.emplace_back("x13*x45 + x14*x46 + x15*x47 + x16*x48");
	polynomialArray.emplace_back("x9*x45 + x10*x46 + x11*x47 + x12*x48");
	polynomialArray.emplace_back("x5*x45 + x6*x46 + x7*x47 + x8*x48");
	polynomialArray.emplace_back("x1*x45 + x2*x46 + x3*x47 + x4*x48");
	polynomialArray.emplace_back("x21*x41 + x22*x42 + x23*x43 + x24*x44");
	polynomialArray.emplace_back("x17*x41 + x18*x42 + x19*x43 + x20*x44");
	polynomialArray.emplace_back("x13*x41 + x14*x42 + x15*x43 + x16*x44");
	polynomialArray.emplace_back("x9*x41 + x10*x42 + x11*x43 + x12*x44");
	polynomialArray.emplace_back("x5*x41 + x6*x42 + x7*x43 + x8*x44");
	polynomialArray.emplace_back("x1*x41 + x2*x42 + x3*x43 + x4*x44");
	polynomialArray.emplace_back("x21*x37 + x22*x38 + x23*x39 + x24*x40");
	polynomialArray.emplace_back("x17*x37 + x18*x38 + x19*x39 + x20*x40");
	polynomialArray.emplace_back("x13*x37 + x14*x38 + x15*x39 + x16*x40");
	polynomialArray.emplace_back("x9*x37 + x10*x38 + x11*x39 + x12*x40");
	polynomialArray.emplace_back("x5*x37 + x6*x38 + x7*x39 + x8*x40");
	polynomialArray.emplace_back("x1*x37 + x2*x38 + x3*x39 + x4*x40");
	polynomialArray.emplace_back("x21*x33 + x22*x34 + x23*x35 + x24*x36");
	polynomialArray.emplace_back("x17*x33 + x18*x34 + x19*x35 + x20*x36");
	polynomialArray.emplace_back("x13*x33 + x14*x34 + x15*x35 + x16*x36");
	polynomialArray.emplace_back("x9*x33 + x10*x34 + x11*x35 + x12*x36");
	polynomialArray.emplace_back("x5*x33 + x6*x34 + x7*x35 + x8*x36");
	polynomialArray.emplace_back("x1*x33 + x2*x34 + x3*x35 + x4*x36");
	polynomialArray.emplace_back("x21*x29 + x22*x30 + x23*x31 + x24*x32");
	polynomialArray.emplace_back("x17*x29 + x18*x30 + x19*x31 + x20*x32");
	polynomialArray.emplace_back("x13*x29 + x14*x30 + x15*x31 + x16*x32");
	polynomialArray.emplace_back("x9*x29 + x10*x30 + x11*x31 + x12*x32");
	polynomialArray.emplace_back("x5*x29 + x6*x30 + x7*x31 + x8*x32");
	polynomialArray.emplace_back("x1*x29 + x2*x30 + x3*x31 + x4*x32");
	polynomialArray.emplace_back("x21*x25 + x22*x26 + x23*x27 + x24*x28");
	polynomialArray.emplace_back("x17*x25 + x18*x26 + x19*x27 + x20*x28");
	polynomialArray.emplace_back("x13*x25 + x14*x26 + x15*x27 + x16*x28");
	polynomialArray.emplace_back("x9*x25 + x10*x26 + x11*x27 + x12*x28");
	polynomialArray.emplace_back("x5*x25 + x6*x26 + x7*x27 + x8*x28");
	polynomialArray.emplace_back("x1*x25 + x2*x26 + x3*x27 + x4*x28");
	polynomialArray.emplace_back("x36*x39*x42*x45 + 1073741826*x35*x40*x42*x45 + 1073741826*x36*x38*x43*x45 + x34*x40*x43*x45 + x35*x38*x44*x45 + 1073741826*x34*x39*x44*x45 + 1073741826*x36*x39*x41*x46 + x35*x40*x41*x46 + x36*x37*x43*x46 + 1073741826*x33*x40*x43*x46 + 1073741826*x35*x37*x44*x46 + x33*x39*x44*x46 + x36*x38*x41*x47 + 1073741826*x34*x40*x41*x47 + 1073741826*x36*x37*x42*x47 + x33*x40*x42*x47 + x34*x37*x44*x47 + 1073741826*x33*x38*x44*x47 + 1073741826*x35*x38*x41*x48 + x34*x39*x41*x48 + x35*x37*x42*x48 + 1073741826*x33*x39*x42*x48 + 1073741826*x34*x37*x43*x48 + x33*x38*x43*x48");
	polynomialArray.emplace_back("x32*x39*x42*x45 + 1073741826*x31*x40*x42*x45 + 1073741826*x32*x38*x43*x45 + x30*x40*x43*x45 + x31*x38*x44*x45 + 1073741826*x30*x39*x44*x45 + 1073741826*x32*x39*x41*x46 + x31*x40*x41*x46 + x32*x37*x43*x46 + 1073741826*x29*x40*x43*x46 + 1073741826*x31*x37*x44*x46 + x29*x39*x44*x46 + x32*x38*x41*x47 + 1073741826*x30*x40*x41*x47 + 1073741826*x32*x37*x42*x47 + x29*x40*x42*x47 + x30*x37*x44*x47 + 1073741826*x29*x38*x44*x47 + 1073741826*x31*x38*x41*x48 + x30*x39*x41*x48 + x31*x37*x42*x48 + 1073741826*x29*x39*x42*x48 + 1073741826*x30*x37*x43*x48 + x29*x38*x43*x48");
	polynomialArray.emplace_back("x28*x39*x42*x45 + 1073741826*x27*x40*x42*x45 + 1073741826*x28*x38*x43*x45 + x26*x40*x43*x45 + x27*x38*x44*x45 + 1073741826*x26*x39*x44*x45 + 1073741826*x28*x39*x41*x46 + x27*x40*x41*x46 + x28*x37*x43*x46 + 1073741826*x25*x40*x43*x46 + 1073741826*x27*x37*x44*x46 + x25*x39*x44*x46 + x28*x38*x41*x47 + 1073741826*x26*x40*x41*x47 + 1073741826*x28*x37*x42*x47 + x25*x40*x42*x47 + x26*x37*x44*x47 + 1073741826*x25*x38*x44*x47 + 1073741826*x27*x38*x41*x48 + x26*x39*x41*x48 + x27*x37*x42*x48 + 1073741826*x25*x39*x42*x48 + 1073741826*x26*x37*x43*x48 + x25*x38*x43*x48");
	polynomialArray.emplace_back("x32*x35*x42*x45 + 1073741826*x31*x36*x42*x45 + 1073741826*x32*x34*x43*x45 + x30*x36*x43*x45 + x31*x34*x44*x45 + 1073741826*x30*x35*x44*x45 + 1073741826*x32*x35*x41*x46 + x31*x36*x41*x46 + x32*x33*x43*x46 + 1073741826*x29*x36*x43*x46 + 1073741826*x31*x33*x44*x46 + x29*x35*x44*x46 + x32*x34*x41*x47 + 1073741826*x30*x36*x41*x47 + 1073741826*x32*x33*x42*x47 + x29*x36*x42*x47 + x30*x33*x44*x47 + 1073741826*x29*x34*x44*x47 + 1073741826*x31*x34*x41*x48 + x30*x35*x41*x48 + x31*x33*x42*x48 + 1073741826*x29*x35*x42*x48 + 1073741826*x30*x33*x43*x48 + x29*x34*x43*x48");
	polynomialArray.emplace_back("x28*x35*x42*x45 + 1073741826*x27*x36*x42*x45 + 1073741826*x28*x34*x43*x45 + x26*x36*x43*x45 + x27*x34*x44*x45 + 1073741826*x26*x35*x44*x45 + 1073741826*x28*x35*x41*x46 + x27*x36*x41*x46 + x28*x33*x43*x46 + 1073741826*x25*x36*x43*x46 + 1073741826*x27*x33*x44*x46 + x25*x35*x44*x46 + x28*x34*x41*x47 + 1073741826*x26*x36*x41*x47 + 1073741826*x28*x33*x42*x47 + x25*x36*x42*x47 + x26*x33*x44*x47 + 1073741826*x25*x34*x44*x47 + 1073741826*x27*x34*x41*x48 + x26*x35*x41*x48 + x27*x33*x42*x48 + 1073741826*x25*x35*x42*x48 + 1073741826*x26*x33*x43*x48 + x25*x34*x43*x48");
	polynomialArray.emplace_back("x28*x31*x42*x45 + 1073741826*x27*x32*x42*x45 + 1073741826*x28*x30*x43*x45 + x26*x32*x43*x45 + x27*x30*x44*x45 + 1073741826*x26*x31*x44*x45 + 1073741826*x28*x31*x41*x46 + x27*x32*x41*x46 + x28*x29*x43*x46 + 1073741826*x25*x32*x43*x46 + 1073741826*x27*x29*x44*x46 + x25*x31*x44*x46 + x28*x30*x41*x47 + 1073741826*x26*x32*x41*x47 + 1073741826*x28*x29*x42*x47 + x25*x32*x42*x47 + x26*x29*x44*x47 + 1073741826*x25*x30*x44*x47 + 1073741826*x27*x30*x41*x48 + x26*x31*x41*x48 + x27*x29*x42*x48 + 1073741826*x25*x31*x42*x48 + 1073741826*x26*x29*x43*x48 + x25*x30*x43*x48");
	polynomialArray.emplace_back("x32*x35*x38*x45 + 1073741826*x31*x36*x38*x45 + 1073741826*x32*x34*x39*x45 + x30*x36*x39*x45 + x31*x34*x40*x45 + 1073741826*x30*x35*x40*x45 + 1073741826*x32*x35*x37*x46 + x31*x36*x37*x46 + x32*x33*x39*x46 + 1073741826*x29*x36*x39*x46 + 1073741826*x31*x33*x40*x46 + x29*x35*x40*x46 + x32*x34*x37*x47 + 1073741826*x30*x36*x37*x47 + 1073741826*x32*x33*x38*x47 + x29*x36*x38*x47 + x30*x33*x40*x47 + 1073741826*x29*x34*x40*x47 + 1073741826*x31*x34*x37*x48 + x30*x35*x37*x48 + x31*x33*x38*x48 + 1073741826*x29*x35*x38*x48 + 1073741826*x30*x33*x39*x48 + x29*x34*x39*x48");
	polynomialArray.emplace_back("x28*x35*x38*x45 + 1073741826*x27*x36*x38*x45 + 1073741826*x28*x34*x39*x45 + x26*x36*x39*x45 + x27*x34*x40*x45 + 1073741826*x26*x35*x40*x45 + 1073741826*x28*x35*x37*x46 + x27*x36*x37*x46 + x28*x33*x39*x46 + 1073741826*x25*x36*x39*x46 + 1073741826*x27*x33*x40*x46 + x25*x35*x40*x46 + x28*x34*x37*x47 + 1073741826*x26*x36*x37*x47 + 1073741826*x28*x33*x38*x47 + x25*x36*x38*x47 + x26*x33*x40*x47 + 1073741826*x25*x34*x40*x47 + 1073741826*x27*x34*x37*x48 + x26*x35*x37*x48 + x27*x33*x38*x48 + 1073741826*x25*x35*x38*x48 + 1073741826*x26*x33*x39*x48 + x25*x34*x39*x48");
	polynomialArray.emplace_back("x28*x31*x38*x45 + 1073741826*x27*x32*x38*x45 + 1073741826*x28*x30*x39*x45 + x26*x32*x39*x45 + x27*x30*x40*x45 + 1073741826*x26*x31*x40*x45 + 1073741826*x28*x31*x37*x46 + x27*x32*x37*x46 + x28*x29*x39*x46 + 1073741826*x25*x32*x39*x46 + 1073741826*x27*x29*x40*x46 + x25*x31*x40*x46 + x28*x30*x37*x47 + 1073741826*x26*x32*x37*x47 + 1073741826*x28*x29*x38*x47 + x25*x32*x38*x47 + x26*x29*x40*x47 + 1073741826*x25*x30*x40*x47 + 1073741826*x27*x30*x37*x48 + x26*x31*x37*x48 + x27*x29*x38*x48 + 1073741826*x25*x31*x38*x48 + 1073741826*x26*x29*x39*x48 + x25*x30*x39*x48");
	polynomialArray.emplace_back("x28*x31*x34*x45 + 1073741826*x27*x32*x34*x45 + 1073741826*x28*x30*x35*x45 + x26*x32*x35*x45 + x27*x30*x36*x45 + 1073741826*x26*x31*x36*x45 + 1073741826*x28*x31*x33*x46 + x27*x32*x33*x46 + x28*x29*x35*x46 + 1073741826*x25*x32*x35*x46 + 1073741826*x27*x29*x36*x46 + x25*x31*x36*x46 + x28*x30*x33*x47 + 1073741826*x26*x32*x33*x47 + 1073741826*x28*x29*x34*x47 + x25*x32*x34*x47 + x26*x29*x36*x47 + 1073741826*x25*x30*x36*x47 + 1073741826*x27*x30*x33*x48 + x26*x31*x33*x48 + x27*x29*x34*x48 + 1073741826*x25*x31*x34*x48 + 1073741826*x26*x29*x35*x48 + x25*x30*x35*x48");
	polynomialArray.emplace_back("x32*x35*x38*x41 + 1073741826*x31*x36*x38*x41 + 1073741826*x32*x34*x39*x41 + x30*x36*x39*x41 + x31*x34*x40*x41 + 1073741826*x30*x35*x40*x41 + 1073741826*x32*x35*x37*x42 + x31*x36*x37*x42 + x32*x33*x39*x42 + 1073741826*x29*x36*x39*x42 + 1073741826*x31*x33*x40*x42 + x29*x35*x40*x42 + x32*x34*x37*x43 + 1073741826*x30*x36*x37*x43 + 1073741826*x32*x33*x38*x43 + x29*x36*x38*x43 + x30*x33*x40*x43 + 1073741826*x29*x34*x40*x43 + 1073741826*x31*x34*x37*x44 + x30*x35*x37*x44 + x31*x33*x38*x44 + 1073741826*x29*x35*x38*x44 + 1073741826*x30*x33*x39*x44 + x29*x34*x39*x44");
	polynomialArray.emplace_back("x28*x35*x38*x41 + 1073741826*x27*x36*x38*x41 + 1073741826*x28*x34*x39*x41 + x26*x36*x39*x41 + x27*x34*x40*x41 + 1073741826*x26*x35*x40*x41 + 1073741826*x28*x35*x37*x42 + x27*x36*x37*x42 + x28*x33*x39*x42 + 1073741826*x25*x36*x39*x42 + 1073741826*x27*x33*x40*x42 + x25*x35*x40*x42 + x28*x34*x37*x43 + 1073741826*x26*x36*x37*x43 + 1073741826*x28*x33*x38*x43 + x25*x36*x38*x43 + x26*x33*x40*x43 + 1073741826*x25*x34*x40*x43 + 1073741826*x27*x34*x37*x44 + x26*x35*x37*x44 + x27*x33*x38*x44 + 1073741826*x25*x35*x38*x44 + 1073741826*x26*x33*x39*x44 + x25*x34*x39*x44");
	polynomialArray.emplace_back("x28*x31*x38*x41 + 1073741826*x27*x32*x38*x41 + 1073741826*x28*x30*x39*x41 + x26*x32*x39*x41 + x27*x30*x40*x41 + 1073741826*x26*x31*x40*x41 + 1073741826*x28*x31*x37*x42 + x27*x32*x37*x42 + x28*x29*x39*x42 + 1073741826*x25*x32*x39*x42 + 1073741826*x27*x29*x40*x42 + x25*x31*x40*x42 + x28*x30*x37*x43 + 1073741826*x26*x32*x37*x43 + 1073741826*x28*x29*x38*x43 + x25*x32*x38*x43 + x26*x29*x40*x43 + 1073741826*x25*x30*x40*x43 + 1073741826*x27*x30*x37*x44 + x26*x31*x37*x44 + x27*x29*x38*x44 + 1073741826*x25*x31*x38*x44 + 1073741826*x26*x29*x39*x44 + x25*x30*x39*x44");
	polynomialArray.emplace_back("x28*x31*x34*x41 + 1073741826*x27*x32*x34*x41 + 1073741826*x28*x30*x35*x41 + x26*x32*x35*x41 + x27*x30*x36*x41 + 1073741826*x26*x31*x36*x41 + 1073741826*x28*x31*x33*x42 + x27*x32*x33*x42 + x28*x29*x35*x42 + 1073741826*x25*x32*x35*x42 + 1073741826*x27*x29*x36*x42 + x25*x31*x36*x42 + x28*x30*x33*x43 + 1073741826*x26*x32*x33*x43 + 1073741826*x28*x29*x34*x43 + x25*x32*x34*x43 + x26*x29*x36*x43 + 1073741826*x25*x30*x36*x43 + 1073741826*x27*x30*x33*x44 + x26*x31*x33*x44 + x27*x29*x34*x44 + 1073741826*x25*x31*x34*x44 + 1073741826*x26*x29*x35*x44 + x25*x30*x35*x44");
	polynomialArray.emplace_back("x28*x31*x34*x37 + 1073741826*x27*x32*x34*x37 + 1073741826*x28*x30*x35*x37 + x26*x32*x35*x37 + x27*x30*x36*x37 + 1073741826*x26*x31*x36*x37 + 1073741826*x28*x31*x33*x38 + x27*x32*x33*x38 + x28*x29*x35*x38 + 1073741826*x25*x32*x35*x38 + 1073741826*x27*x29*x36*x38 + x25*x31*x36*x38 + x28*x30*x33*x39 + 1073741826*x26*x32*x33*x39 + 1073741826*x28*x29*x34*x39 + x25*x32*x34*x39 + x26*x29*x36*x39 + 1073741826*x25*x30*x36*x39 + 1073741826*x27*x30*x33*x40 + x26*x31*x33*x40 + x27*x29*x34*x40 + 1073741826*x25*x31*x34*x40 + 1073741826*x26*x29*x35*x40 + x25*x30*x35*x40");
	polynomialArray.emplace_back("x12*x15*x18*x21 + 1073741826*x11*x16*x18*x21 + 1073741826*x12*x14*x19*x21 + x10*x16*x19*x21 + x11*x14*x20*x21 + 1073741826*x10*x15*x20*x21 + 1073741826*x12*x15*x17*x22 + x11*x16*x17*x22 + x12*x13*x19*x22 + 1073741826*x9*x16*x19*x22 + 1073741826*x11*x13*x20*x22 + x9*x15*x20*x22 + x12*x14*x17*x23 + 1073741826*x10*x16*x17*x23 + 1073741826*x12*x13*x18*x23 + x9*x16*x18*x23 + x10*x13*x20*x23 + 1073741826*x9*x14*x20*x23 + 1073741826*x11*x14*x17*x24 + x10*x15*x17*x24 + x11*x13*x18*x24 + 1073741826*x9*x15*x18*x24 + 1073741826*x10*x13*x19*x24 + x9*x14*x19*x24");
	polynomialArray.emplace_back("x8*x15*x18*x21 + 1073741826*x7*x16*x18*x21 + 1073741826*x8*x14*x19*x21 + x6*x16*x19*x21 + x7*x14*x20*x21 + 1073741826*x6*x15*x20*x21 + 1073741826*x8*x15*x17*x22 + x7*x16*x17*x22 + x8*x13*x19*x22 + 1073741826*x5*x16*x19*x22 + 1073741826*x7*x13*x20*x22 + x5*x15*x20*x22 + x8*x14*x17*x23 + 1073741826*x6*x16*x17*x23 + 1073741826*x8*x13*x18*x23 + x5*x16*x18*x23 + x6*x13*x20*x23 + 1073741826*x5*x14*x20*x23 + 1073741826*x7*x14*x17*x24 + x6*x15*x17*x24 + x7*x13*x18*x24 + 1073741826*x5*x15*x18*x24 + 1073741826*x6*x13*x19*x24 + x5*x14*x19*x24");
	polynomialArray.emplace_back("x4*x15*x18*x21 + 1073741826*x3*x16*x18*x21 + 1073741826*x4*x14*x19*x21 + x2*x16*x19*x21 + x3*x14*x20*x21 + 1073741826*x2*x15*x20*x21 + 1073741826*x4*x15*x17*x22 + x3*x16*x17*x22 + x4*x13*x19*x22 + 1073741826*x1*x16*x19*x22 + 1073741826*x3*x13*x20*x22 + x1*x15*x20*x22 + x4*x14*x17*x23 + 1073741826*x2*x16*x17*x23 + 1073741826*x4*x13*x18*x23 + x1*x16*x18*x23 + x2*x13*x20*x23 + 1073741826*x1*x14*x20*x23 + 1073741826*x3*x14*x17*x24 + x2*x15*x17*x24 + x3*x13*x18*x24 + 1073741826*x1*x15*x18*x24 + 1073741826*x2*x13*x19*x24 + x1*x14*x19*x24");
	polynomialArray.emplace_back("x8*x11*x18*x21 + 1073741826*x7*x12*x18*x21 + 1073741826*x8*x10*x19*x21 + x6*x12*x19*x21 + x7*x10*x20*x21 + 1073741826*x6*x11*x20*x21 + 1073741826*x8*x11*x17*x22 + x7*x12*x17*x22 + x8*x9*x19*x22 + 1073741826*x5*x12*x19*x22 + 1073741826*x7*x9*x20*x22 + x5*x11*x20*x22 + x8*x10*x17*x23 + 1073741826*x6*x12*x17*x23 + 1073741826*x8*x9*x18*x23 + x5*x12*x18*x23 + x6*x9*x20*x23 + 1073741826*x5*x10*x20*x23 + 1073741826*x7*x10*x17*x24 + x6*x11*x17*x24 + x7*x9*x18*x24 + 1073741826*x5*x11*x18*x24 + 1073741826*x6*x9*x19*x24 + x5*x10*x19*x24");
	polynomialArray.emplace_back("x4*x11*x18*x21 + 1073741826*x3*x12*x18*x21 + 1073741826*x4*x10*x19*x21 + x2*x12*x19*x21 + x3*x10*x20*x21 + 1073741826*x2*x11*x20*x21 + 1073741826*x4*x11*x17*x22 + x3*x12*x17*x22 + x4*x9*x19*x22 + 1073741826*x1*x12*x19*x22 + 1073741826*x3*x9*x20*x22 + x1*x11*x20*x22 + x4*x10*x17*x23 + 1073741826*x2*x12*x17*x23 + 1073741826*x4*x9*x18*x23 + x1*x12*x18*x23 + x2*x9*x20*x23 + 1073741826*x1*x10*x20*x23 + 1073741826*x3*x10*x17*x24 + x2*x11*x17*x24 + x3*x9*x18*x24 + 1073741826*x1*x11*x18*x24 + 1073741826*x2*x9*x19*x24 + x1*x10*x19*x24");
	polynomialArray.emplace_back("x4*x7*x18*x21 + 1073741826*x3*x8*x18*x21 + 1073741826*x4*x6*x19*x21 + x2*x8*x19*x21 + x3*x6*x20*x21 + 1073741826*x2*x7*x20*x21 + 1073741826*x4*x7*x17*x22 + x3*x8*x17*x22 + x4*x5*x19*x22 + 1073741826*x1*x8*x19*x22 + 1073741826*x3*x5*x20*x22 + x1*x7*x20*x22 + x4*x6*x17*x23 + 1073741826*x2*x8*x17*x23 + 1073741826*x4*x5*x18*x23 + x1*x8*x18*x23 + x2*x5*x20*x23 + 1073741826*x1*x6*x20*x23 + 1073741826*x3*x6*x17*x24 + x2*x7*x17*x24 + x3*x5*x18*x24 + 1073741826*x1*x7*x18*x24 + 1073741826*x2*x5*x19*x24 + x1*x6*x19*x24");
	polynomialArray.emplace_back("x8*x11*x14*x21 + 1073741826*x7*x12*x14*x21 + 1073741826*x8*x10*x15*x21 + x6*x12*x15*x21 + x7*x10*x16*x21 + 1073741826*x6*x11*x16*x21 + 1073741826*x8*x11*x13*x22 + x7*x12*x13*x22 + x8*x9*x15*x22 + 1073741826*x5*x12*x15*x22 + 1073741826*x7*x9*x16*x22 + x5*x11*x16*x22 + x8*x10*x13*x23 + 1073741826*x6*x12*x13*x23 + 1073741826*x8*x9*x14*x23 + x5*x12*x14*x23 + x6*x9*x16*x23 + 1073741826*x5*x10*x16*x23 + 1073741826*x7*x10*x13*x24 + x6*x11*x13*x24 + x7*x9*x14*x24 + 1073741826*x5*x11*x14*x24 + 1073741826*x6*x9*x15*x24 + x5*x10*x15*x24");
	polynomialArray.emplace_back("x4*x11*x14*x21 + 1073741826*x3*x12*x14*x21 + 1073741826*x4*x10*x15*x21 + x2*x12*x15*x21 + x3*x10*x16*x21 + 1073741826*x2*x11*x16*x21 + 1073741826*x4*x11*x13*x22 + x3*x12*x13*x22 + x4*x9*x15*x22 + 1073741826*x1*x12*x15*x22 + 1073741826*x3*x9*x16*x22 + x1*x11*x16*x22 + x4*x10*x13*x23 + 1073741826*x2*x12*x13*x23 + 1073741826*x4*x9*x14*x23 + x1*x12*x14*x23 + x2*x9*x16*x23 + 1073741826*x1*x10*x16*x23 + 1073741826*x3*x10*x13*x24 + x2*x11*x13*x24 + x3*x9*x14*x24 + 1073741826*x1*x11*x14*x24 + 1073741826*x2*x9*x15*x24 + x1*x10*x15*x24");
	polynomialArray.emplace_back("x4*x7*x14*x21 + 1073741826*x3*x8*x14*x21 + 1073741826*x4*x6*x15*x21 + x2*x8*x15*x21 + x3*x6*x16*x21 + 1073741826*x2*x7*x16*x21 + 1073741826*x4*x7*x13*x22 + x3*x8*x13*x22 + x4*x5*x15*x22 + 1073741826*x1*x8*x15*x22 + 1073741826*x3*x5*x16*x22 + x1*x7*x16*x22 + x4*x6*x13*x23 + 1073741826*x2*x8*x13*x23 + 1073741826*x4*x5*x14*x23 + x1*x8*x14*x23 + x2*x5*x16*x23 + 1073741826*x1*x6*x16*x23 + 1073741826*x3*x6*x13*x24 + x2*x7*x13*x24 + x3*x5*x14*x24 + 1073741826*x1*x7*x14*x24 + 1073741826*x2*x5*x15*x24 + x1*x6*x15*x24");
	polynomialArray.emplace_back("x4*x7*x10*x21 + 1073741826*x3*x8*x10*x21 + 1073741826*x4*x6*x11*x21 + x2*x8*x11*x21 + x3*x6*x12*x21 + 1073741826*x2*x7*x12*x21 + 1073741826*x4*x7*x9*x22 + x3*x8*x9*x22 + x4*x5*x11*x22 + 1073741826*x1*x8*x11*x22 + 1073741826*x3*x5*x12*x22 + x1*x7*x12*x22 + x4*x6*x9*x23 + 1073741826*x2*x8*x9*x23 + 1073741826*x4*x5*x10*x23 + x1*x8*x10*x23 + x2*x5*x12*x23 + 1073741826*x1*x6*x12*x23 + 1073741826*x3*x6*x9*x24 + x2*x7*x9*x24 + x3*x5*x10*x24 + 1073741826*x1*x7*x10*x24 + 1073741826*x2*x5*x11*x24 + x1*x6*x11*x24");
	polynomialArray.emplace_back("x8*x11*x14*x17 + 1073741826*x7*x12*x14*x17 + 1073741826*x8*x10*x15*x17 + x6*x12*x15*x17 + x7*x10*x16*x17 + 1073741826*x6*x11*x16*x17 + 1073741826*x8*x11*x13*x18 + x7*x12*x13*x18 + x8*x9*x15*x18 + 1073741826*x5*x12*x15*x18 + 1073741826*x7*x9*x16*x18 + x5*x11*x16*x18 + x8*x10*x13*x19 + 1073741826*x6*x12*x13*x19 + 1073741826*x8*x9*x14*x19 + x5*x12*x14*x19 + x6*x9*x16*x19 + 1073741826*x5*x10*x16*x19 + 1073741826*x7*x10*x13*x20 + x6*x11*x13*x20 + x7*x9*x14*x20 + 1073741826*x5*x11*x14*x20 + 1073741826*x6*x9*x15*x20 + x5*x10*x15*x20");
	polynomialArray.emplace_back("x4*x11*x14*x17 + 1073741826*x3*x12*x14*x17 + 1073741826*x4*x10*x15*x17 + x2*x12*x15*x17 + x3*x10*x16*x17 + 1073741826*x2*x11*x16*x17 + 1073741826*x4*x11*x13*x18 + x3*x12*x13*x18 + x4*x9*x15*x18 + 1073741826*x1*x12*x15*x18 + 1073741826*x3*x9*x16*x18 + x1*x11*x16*x18 + x4*x10*x13*x19 + 1073741826*x2*x12*x13*x19 + 1073741826*x4*x9*x14*x19 + x1*x12*x14*x19 + x2*x9*x16*x19 + 1073741826*x1*x10*x16*x19 + 1073741826*x3*x10*x13*x20 + x2*x11*x13*x20 + x3*x9*x14*x20 + 1073741826*x1*x11*x14*x20 + 1073741826*x2*x9*x15*x20 + x1*x10*x15*x20");
	polynomialArray.emplace_back("x4*x7*x14*x17 + 1073741826*x3*x8*x14*x17 + 1073741826*x4*x6*x15*x17 + x2*x8*x15*x17 + x3*x6*x16*x17 + 1073741826*x2*x7*x16*x17 + 1073741826*x4*x7*x13*x18 + x3*x8*x13*x18 + x4*x5*x15*x18 + 1073741826*x1*x8*x15*x18 + 1073741826*x3*x5*x16*x18 + x1*x7*x16*x18 + x4*x6*x13*x19 + 1073741826*x2*x8*x13*x19 + 1073741826*x4*x5*x14*x19 + x1*x8*x14*x19 + x2*x5*x16*x19 + 1073741826*x1*x6*x16*x19 + 1073741826*x3*x6*x13*x20 + x2*x7*x13*x20 + x3*x5*x14*x20 + 1073741826*x1*x7*x14*x20 + 1073741826*x2*x5*x15*x20 + x1*x6*x15*x20");
	polynomialArray.emplace_back("x4*x7*x10*x17 + 1073741826*x3*x8*x10*x17 + 1073741826*x4*x6*x11*x17 + x2*x8*x11*x17 + x3*x6*x12*x17 + 1073741826*x2*x7*x12*x17 + 1073741826*x4*x7*x9*x18 + x3*x8*x9*x18 + x4*x5*x11*x18 + 1073741826*x1*x8*x11*x18 + 1073741826*x3*x5*x12*x18 + x1*x7*x12*x18 + x4*x6*x9*x19 + 1073741826*x2*x8*x9*x19 + 1073741826*x4*x5*x10*x19 + x1*x8*x10*x19 + x2*x5*x12*x19 + 1073741826*x1*x6*x12*x19 + 1073741826*x3*x6*x9*x20 + x2*x7*x9*x20 + x3*x5*x10*x20 + 1073741826*x1*x7*x10*x20 + 1073741826*x2*x5*x11*x20 + x1*x6*x11*x20");
	polynomialArray.emplace_back("x4*x7*x10*x13 + 1073741826*x3*x8*x10*x13 + 1073741826*x4*x6*x11*x13 + x2*x8*x11*x13 + x3*x6*x12*x13 + 1073741826*x2*x7*x12*x13 + 1073741826*x4*x7*x9*x14 + x3*x8*x9*x14 + x4*x5*x11*x14 + 1073741826*x1*x8*x11*x14 + 1073741826*x3*x5*x12*x14 + x1*x7*x12*x14 + x4*x6*x9*x15 + 1073741826*x2*x8*x9*x15 + 1073741826*x4*x5*x10*x15 + x1*x8*x10*x15 + x2*x5*x12*x15 + 1073741826*x1*x6*x12*x15 + 1073741826*x3*x6*x9*x16 + x2*x7*x9*x16 + x3*x5*x10*x16 + 1073741826*x1*x7*x10*x16 + 1073741826*x2*x5*x11*x16 + x1*x6*x11*x16");

	vector<string> basis = groebnerBasisF4(1073741827, 48, variableName, polynomialArray, 1, 0);

	std::cout << "The basis contains " << basis.size() << " elements." << std::endl;


	ofstream output;
	output.open("/home/demin/Groebner.jl/benchmark/results/openf4/benchmark_14/yang1//output");
	output << "x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32, x33, x34, x35, x36, x37, x38, x39, x40, x41, x42, x43, x44, x45, x46, x47, x48" << endl;
	output << "1073741827" << endl;
	for (size_t i = 0; i < basis.size(); i++) {
		output << basis[i] << "," << endl;
	}
	output.close();

	return 0;
}

