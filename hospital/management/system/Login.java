package hospital.management.system;
import java.awt.ActiveEvent;
import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;

import javax.swing.*;
public class Login extends JFrame implements ActionListener{
    JTextField textField;
    JPasswordField  jPasswordField;
    JButton b1,b2;
    Login(){

        JLabel namelabel = new JLabel("Username");
        namelabel.setBounds(40, 20, 100, 30);
        namelabel.setFont(new Font( "Tahoma",Font.BOLD,16) );
        namelabel.setForeground(Color.white);
        add(namelabel);

        JLabel passwordLabel = new JLabel("Password");
        passwordLabel.setBounds(40, 70, 100, 30);  // Corrected this line to set bounds for passwordLabel
        passwordLabel.setFont(new Font("Tahoma", Font.BOLD, 16));
        passwordLabel.setForeground(Color.white);
        add(passwordLabel);

        textField = new JTextField();
        textField.setBounds(150,20,150,30);
        textField.setFont(new Font("Tahoma",Font.PLAIN,15));
        textField.setBackground(new Color(255,255,255));
        add(textField);

        jPasswordField = new JPasswordField();
        jPasswordField.setBounds(150,70,150,30);
        jPasswordField.setFont(new Font("Tahoma",Font.PLAIN,15));
        jPasswordField.setBackground(new Color(255,255,255));
        add(jPasswordField);

        ImageIcon imageIcon = new ImageIcon(ClassLoader.getSystemResource("Icons/logo.png"));
        Image i1 = imageIcon.getImage().getScaledInstance(400, 400, Image.SCALE_SMOOTH);
        ImageIcon imageIcon1 = new ImageIcon(i1);
        JLabel label = new JLabel(imageIcon1);
        label.setBounds(330,-30,400,300);
        add(label);

        JButton b1 = new JButton("Login");
        b1.setBounds(40, 140, 120, 30);
        b1.setFont(new Font("Tahoma", Font.BOLD, 15));  // Changed to "Tahoma" for consistency
        b1.setBackground(Color.YELLOW);
        b1.setOpaque(true);  // Ensures background color is applied
        b1.setBorderPainted(false);
        b1.setForeground(Color.BLACK);
        // b1.addActionListener(this);
        // add(b1);
        b1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Reception reception = new Reception();
                reception.setVisible(true);  // Ensure the frame is visible
            }
        });
        add(b1);

        // Cancel button
        b2 = new JButton("Cancel");
        b2.setBounds(180, 140, 120, 30);
        b2.setFont(new Font("Tahoma", Font.BOLD, 15));  // Changed to "Tahoma" for consistency
        b2.setBackground(Color.YELLOW);
        b2.setOpaque(true);  // Ensures background color is applied
        b2.setBorderPainted(false); 
        b2.setForeground(Color.BLACK);
        b2.addActionListener(this);
        add(b2);

        getContentPane().setBackground(new Color(12,119,198));
        setSize( 750, 300);
        setLocation(500,270);
        setLayout(null);
        setVisible(true);

    }
    @Override
    public void actionPerformed(ActionEvent e){
        if(e.getSource()==b1){
            try{
                conn c = new conn();
                String user = textField.getText();
                String Pass = jPasswordField.getText();

                 String q = "select * from login where ID = '" + user + "' and PW = '" + Pass + "'";
                ResultSet resultSet = c.statement.executeQuery(q);


                if(resultSet.next()){
                    new Reception();
                    setVisible(false);
                }else{
                    JOptionPane.showMessageDialog(null, "Invalid");
                }

            }catch(Exception E){
                E.printStackTrace();
            }
        }else{
            System.exit(0);
        }

    } 
    public static void main(String[] args) {
        new Login();
        
    }
}
