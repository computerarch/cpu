#include <iostream>
#include <QString>
#include <QTextStream>
#include <QFile>
using namespace std;
// R-type op rs rt rd
// I-type op rs im rt
// except beg => op rs rt im
void createMap(unordered_map<string, char> *um)
{
    (*um)["0000"] = '0';
    (*um)["0001"] = '1';
    (*um)["0010"] = '2';
    (*um)["0011"] = '3';
    (*um)["0100"] = '4';
    (*um)["0101"] = '5';
    (*um)["0110"] = '6';
    (*um)["0111"] = '7';
    (*um)["1000"] = '8';
    (*um)["1001"] = '9';
    (*um)["1010"] = 'A';
    (*um)["1011"] = 'B';
    (*um)["1100"] = 'C';
    (*um)["1101"] = 'D';
    (*um)["1110"] = 'E';
    (*um)["1111"] = 'F';
}
 QString convertBinToHex(string bin)
{
    int l = bin.size();
    int t = bin.find_first_of('.');
         int len_left = t != -1 ? t : l;
    for (int i = 1; i <= (4 - len_left % 4) % 4; i++)
        bin = '0' + bin;
         if (t != -1)
    {
        int len_right = l - len_left - 1;
        for (int i = 1; i <= (4 - len_right % 4) % 4; i++)
            bin = bin + '0';
    }
    unordered_map<string, char> bin_hex_map;
    createMap(&bin_hex_map);

    int i = 0;
    QString hex = "";

    while (1)
    {
        hex += bin_hex_map[bin.substr(i, 4)];
        i += 4;
        if (i == bin.size())
            break;
        if (bin.at(i) == '.')
        {
            hex += '.';
            i++;
        }
    }
    return hex;
}

QString Convert_d_to_b(QString s)
{
    int x = s.toInt();
    if (x == 0)
    {
        s = "00";
    }
    else if (x == 1)
    {
        s = "01";
    }
    else if (x == 2)
    {
        s = "10";
    }
    else if (x == 3)
    {
        s = "11";
    }
    return s;
}
QString Im_convert(QString s)
{
    int x = s.toInt();
    QString tmp = "00000000000";
    for (int i = tmp.length() - 1; i >= 0; i--)
    {
        if (x != 0)
        {
            int m = x % 2;
            if (m != 0)
            {
                tmp[i] = '1';
            }
            x /= 2;
        }
        else
        {
            break;
        }
    }
    return tmp;
}
QStringList RType(QString op,QString rs,QString rt,QString rd,QString function)
{
    QStringList result;
    result.append(op);
    result.append(Convert_d_to_b(rs));
    result.append(Convert_d_to_b(rt));
    result.append(Convert_d_to_b(rd));
    result.append(function);
    return result;
}
QStringList IType(QString op,QString rs,QString rt,QString im)
{
    QStringList result;
    result.append(op);
    result.append(Convert_d_to_b(rs));
    result.append(Convert_d_to_b(rt));
    result.append(Im_convert(im));
    return result;
}
int main(void)
{
    QFile ins("str.txt");
    ins.open(QFile::Text | QFile::ReadOnly);
    QTextStream input(&ins);
    QFile out2("out.txt");
    QFile out16("out16.txt");
    QTextStream output16 (&out16);
    out2.open(QFile::Text | QFile::WriteOnly);
    out16.open(QFile::Text | QFile::WriteOnly);
    QTextStream output2(&out2);
    while (!input.atEnd())
    {

        QStringList result,data = input.readLine().split(' ');
        QString function = "",Reg = data[0],op = "00000";
        QString str = "";
        if (Reg == "and")
        {
            function = "000000010";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "or")
        {
            function = "000000100";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "xor")
        {
            function = "000000110";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "add")
        {
            function = "000001000";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "sub")
        {
            function = "000001010";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "mul")
        {
            function = "000001100";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "div")
        {
            function = "000001110";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "lw")
        {
            op = "00011";
            result = IType(op,data[3],data[1],data[2]);
        }
        else if (Reg == "sw")
        {
            op = "01011";
            result = IType(op,data[3],data[1],data[2]);
        }
        else if (Reg == "beq")
        {
            op = "00001";
            result = IType(op,data[1],data[2],data[3]);
        }
        for (auto ii = result.begin() ; ii != result.end(); ii++)
        {
            output2 << *ii;
            str += *ii;
        }
        output2 << "\n";
        output16 << convertBinToHex(str.toStdString());
        output16 << "\n";
    }
    ins.close();
    out2.close();
    out16.close();
    return 0;
}
