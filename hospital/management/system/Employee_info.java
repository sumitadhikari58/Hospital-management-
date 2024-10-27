package hospital.management.system;

import javax.swing.*;

import net.proteanit.sql.DbUtils;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;

 public class Employee_info extends JFrame {

    Employee_info() {
        JPanel panel = new JPanel();
        panel.setBounds(5, 5, 990, 590);
        panel.setBackground(new Color(12, 119, 198));
        panel.setLayout(null);
        add(panel);

        JTable table = new JTable();
        table.setBounds(10, 34, 980, 450);
        table.setBackground(new Color(12, 119, 198));
        table.setForeground(Color.WHITE);
        table.setRowHeight(25);
        table.setFont(new Font("Tahoma", Font.PLAIN, 12));
        panel.add(table);

        try {
            conn c = new conn();
            String q = "SELECT * FROM EMP_INFO";
            ResultSet resultSet = c.statement.executeQuery(q);
            table.setModel(DbUtils.resultSetToTableModel(resultSet));
        } catch (Exception e) {
            e.printStackTrace();
        }

        JLabel label1 = new JLabel("Name");
        label1.setBounds(41, 9, 70, 20);
        label1.setForeground(new Color(255,215,0));
        label1.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label1);

        JLabel label2 = new JLabel("Age");
        label2.setBounds(180, 9, 70, 20);
        label2.setForeground(new Color(255,215,0));
        label2.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label2);

        JLabel label3 = new JLabel("Phone Number");
        label3.setBounds(350, 9, 150, 20);
        label3.setForeground(new Color(255,215,0));
        label3.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label3);

        JLabel label4 = new JLabel("Salary");
        label4.setBounds(550, 9, 150, 20);
        label4.setForeground(new Color(255,215,0));
        label4.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label4);

        JLabel label5 = new JLabel("Gmail");
        label5.setBounds(730, 9, 150, 20);
        label5.setForeground(new Color(255,215,0));
        label5.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label5);

        JLabel label6 = new JLabel("Aadhar Number");
        label6.setBounds(830, 9, 150, 20);
        label6.setForeground(new Color(255,215,0));
        label6.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label6);

        JButton button = new JButton("BACK");
        button.setBounds(350, 500, 120, 30);
        button.setBackground(Color.white);
        button.setForeground(Color.black);
        panel.add(button);

        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                setVisible(false);
            }
        });

        setUndecorated(true);
        setSize(1000, 600);
        setLocation(350, 230);
        setLayout(null);
        setVisible(true);
    }

    public static void main(String[] args) {
        new Employee_info();
    }
}