package hospital.management.system;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import javax.swing.*;
import net.proteanit.sql.DbUtils;

public class Room extends JFrame {
    JTable table;

    Room() {
        JPanel panel = new JPanel();
        panel.setBounds(5, 5, 890, 590);
        panel.setBackground(new Color(12, 119, 198));
        panel.setLayout(null);
        add(panel);

        ImageIcon imageIcon = new ImageIcon(ClassLoader.getSystemResource("Icons/roomm.png"));
        Image image = imageIcon.getImage().getScaledInstance(200, 200, Image.SCALE_SMOOTH);
        ImageIcon imageIcon1 = new ImageIcon(image);
        JLabel label = new JLabel(imageIcon1);
        label.setBounds(600, 200, 200, 200);
        panel.add(label);

        table = new JTable();
        table.setBounds(10,40,500,400);
        table.setBackground(new Color(12, 119, 198));
        table.setForeground(new Color(255,255,255));
        panel.add(table);

        try {
            conn c = new conn();
            String q = "select * from room";
            ResultSet resultSet = c.statement.executeQuery(q);
            table.setModel(DbUtils.resultSetToTableModel(resultSet));
        } catch (Exception e) {
            e.printStackTrace();
        }


        JLabel label1 = new JLabel("Room No");
        label1.setBounds(10,10,80,20);
        label1.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label1);

        JLabel label2 = new JLabel("Availability");
        label2.setBounds(140, 10, 100, 20);
        label2.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label2);

        JLabel label3 = new JLabel("Price");
        label3.setBounds(269, 15, 80, 15);
        label3.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label3);

        JLabel label4 = new JLabel("Bed Type");
        label4.setBounds(390, 15, 80, 15);
        label4.setFont(new Font("Tahoma", Font.BOLD, 14));
        panel.add(label4);

        setSize(900, 600);
        setLayout(null);
        setLocation(300, 230);
        setVisible(true);

        JButton back = new JButton ( "Back");
        back. setBounds ( 200,  500,  120,  30) ; 
        back. setBackground (Color.white);
        back. setForeground (Color.BLACK);
        panel. add (back);
        back.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e){
                setVisible(false);
            }
            
        } );
    }
  
    

    public static void main(String[] args) {
        new Room();
    }
}