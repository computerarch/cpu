#include <iostream>
#include <QString>
#include <QTextStream>
#include <QFile>
using namespace std;
// R-type op rs rt rd
// I-type op rs im rt
// except beg => op rs rt im
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
    QString tmp = "0000000";
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
    QFile ins("../assembler_input/str.txt");
    ins.open(QFile::Text | QFile::ReadOnly);
    QTextStream input(&ins);
    QFile out("../assembler_output/out.txt");
    out.open(QFile::Text | QFile::WriteOnly);
    QTextStream output(&out);
    while (!input.atEnd())
    {

        QStringList result,data = input.readLine().split(' ');
        QString function = "",Reg = data[0],op = "00000";
        if (Reg == "and")
        {
            function = "00010";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "or")
        {
            function = "00100";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "xor")
        {
            function = "00110";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "nor")
        {
            function = "01111";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "add")
        {
            function = "01000";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "sub")
        {
            function = "01010";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "mul")
        {
            function = "01100";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "div")
        {
            function = "01110";
            result = RType(op, data[1], data[2], data[3], function);
        }
        else if (Reg == "sw")
        {
            op = "00011";
            result = IType(op,data[3],data[1],data[2]);
        }
        else if (Reg == "lw")
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
            output << *ii;
        }
        output << "\n";
    }
    ins.close();
    out.close();
    return 0;
}
