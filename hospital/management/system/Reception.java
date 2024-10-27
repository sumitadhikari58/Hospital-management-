package hospital.management.system;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class Reception extends JFrame {

    Reception() {
        // Your screen dimensions
        int screenWidth = 2560;
        int screenHeight = 1600;

        JPanel panel = new JPanel();
        panel.setLayout(null);
        panel.setBounds(5, 160, screenWidth - 40, screenHeight - 400);
        panel.setBackground(new Color(12, 119, 198));
        add(panel);

        JPanel panel1 = new JPanel();
        panel1.setLayout(null);
        panel1.setBounds(5, 5, screenWidth - 40, 150);
        panel1.setBackground(new Color(12, 119, 198));
        add(panel1);

        ImageIcon i1 = new ImageIcon(ClassLoader.getSystemResource("Icons/doc.png"));
        Image image = i1.getImage().getScaledInstance(250, 250, Image.SCALE_SMOOTH);
        ImageIcon i2 = new ImageIcon(image);
        JLabel label = new JLabel(i2);

        // Set the label position considering your screen width
        label.setBounds(1425 , -38, 250, 250);
        panel1.add(label);


        ImageIcon i11= new ImageIcon(ClassLoader.getSystemResource("Icons/rec.png"));
        Image image1 = i11.getImage().getScaledInstance(250, 250, Image.SCALE_SMOOTH);
        ImageIcon i22 = new ImageIcon(image1);
        JLabel label1 = new JLabel(i22);

        // Set the label position considering your screen width
        label1.setBounds(1200, -50, 250, 250);
        panel1.add(label1);

        JButton btn1 = new JButton("ADD NEW PATIENT");
btn1.setBounds(30, 15, 200, 30);  // Position of btn1 remains the same
btn1.setBackground(new Color(255, 255, 255));
panel1.add(btn1);
btn1.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        new NEW_PATIENT();
    }
});

JButton btn2 = new JButton("ROOM");
btn2.setBounds(30, 58, 200, 30);  // Position of btn2 remains the same
btn2.setBackground(new Color(255, 255, 255));
panel1.add(btn2);
btn2.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        new Room();  
    }
});

JButton btn3 = new JButton("DEPARTMENT");
btn3.setBounds(30, 100, 200, 30);  // Position of btn3 remains the same
btn3.setBackground(new Color(255, 255, 255));
panel1.add(btn3);
btn3.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        new Department();
    }
});

JButton btn4 = new JButton("DOCTOR INFO");
btn4.setBounds(270, 15, 200, 30);  // Position of btn4 remains the same
btn4.setBackground(new Color(255, 255, 255));
panel1.add(btn4);
btn4.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        new Employee_info();
    }
});

JButton btn5 = new JButton("PATIENT INFO");
btn5.setBounds(270, 58, 200, 30);  // Position of btn5 remains the same
btn5.setBackground(new Color(255, 255, 255));
panel1.add(btn5);
btn5.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        new ALL_Patient_Info();
    }
});

JButton btn7 = new JButton("PATIENT DISCHARGE");
btn7.setBounds(270, 100, 200, 30);  // Adjusted btn7 to match previous row layout
btn7.setBackground(new Color(255, 255, 255));
panel1.add(btn7);
btn7.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        new patient_discharge();
    }
});

JButton btn8 = new JButton("UPDATE PATIENT DETAILS");
btn8.setBounds(510, 15, 200, 30);  // Moved btn8 up to fill the previous space of btn7
btn8.setBackground(new Color(255, 255, 255));
panel1.add(btn8);
btn8.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        new update_patient_details();
    }
});

JButton btn9 = new JButton("HOSPITAL AMBULANCE");
btn9.setBounds(510, 58, 200, 30);  // Moved btn9 up to fill the space of btn8
btn9.setBackground(new Color(255, 255, 255));
panel1.add(btn9);
btn9.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        new Ambulance();
    }
});

JButton btn10 = new JButton("SEARCH ROOM");
btn10.setBounds(510, 100, 200, 30);  // Moved btn10 up to fill the space of btn9
btn10.setBackground(new Color(255, 255, 255));
panel1.add(btn10);
btn10.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        new SearchRoom();
    }
});

JButton btn11 = new JButton("LOGOUT");
btn11.setBounds(750, 15, 200, 30);  // Adjusted the position of the logout button to maintain balance
btn11.setBackground(new Color(255, 255, 255));
panel1.add(btn11);
btn11.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e){
        setVisible(false);
        new Login();
    }
});
        // Set frame properties
        setSize(screenWidth, screenHeight);
        setLayout(null);
        getContentPane().setBackground(Color.white);
        setLocationRelativeTo(null); // Center the window on the screen
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public static void main(String[] args) {
        new Reception().setVisible(true);
    }
}