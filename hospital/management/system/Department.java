package hospital.management.system;

import net.proteanit.sql.DbUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;

public class Department extends JFrame {
    Department(){

        JPanel panel = new JPanel();
        panel.setBounds(5,5,690,490);
        panel.setLayout(null);
        panel.setBackground(new Color(12, 119, 198));
        add(panel);

        JTable table = new JTable();
        table.setBounds(0,40,700,350);
        table.setBackground(new Color(12, 119, 198));
        table.setRowHeight(25);
        table.setForeground(new Color(255,255,255));
        table.setFont(new Font("SansSerif,",Font.PLAIN,12));
        panel.add(table);

        try{
            conn c = new conn();
            String q = "select * from department";
            ResultSet resultSet = c.statement.executeQuery(q);
            table.setModel(DbUtils.resultSetToTableModel(resultSet));
        }catch (Exception e){
            e.printStackTrace();
        }

        JLabel label1 = new JLabel("Department");
        label1.setBounds(50,11,105,20);
        label1.setForeground(new Color(255,215,0));
        label1.setFont(new Font("DejaVu Sans Mono",Font.BOLD,17));
        panel.add(label1);

        JLabel label2 = new JLabel("Phone Number");
        label2.setBounds(360,11,150,20);
        label2.setForeground(new Color(255,215,0));
        label2.setFont(new Font("DejaVu Sans Mono",Font.BOLD,17));
        panel.add(label2);

        JButton b1 = new JButton("BACK");
        b1.setBounds(400,410,130,30);
        b1.setBackground(Color.WHITE);
        b1.setForeground(Color.BLACK);
        panel.add(b1);
        b1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                setVisible(false);
            }
        });

        setUndecorated(true);
        setSize(700,500);
        setLayout(null);
        setLocation(350,250);
        setVisible(true);

    }

    public static void main(String[] args) {
         new Department();
    }
}
