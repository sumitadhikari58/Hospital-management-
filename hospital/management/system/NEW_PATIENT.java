package hospital.management.system;
import java.awt.Choice;
import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
// import java.sql.Date;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.util.Date;
import javax.swing.*;





public class NEW_PATIENT extends JFrame implements ActionListener{
    
    JComboBox comboBox;

    JTextField textFieldNumber,textName,textFieldDisease,textFieldDeposite;
    JRadioButton r1,r2;
     Choice c1;
     JLabel date;
     JButton b1,b2;
    
    NEW_PATIENT(){

        JPanel panel = new JPanel();
        panel.setBounds(5,5,840,540);
        panel.setBackground(new Color(12,119,198));
        panel.setLayout(null);
        add(panel);


        ImageIcon imageIcon = new ImageIcon(ClassLoader.getSystemResource("Icons/logo3.png"));
        java.awt.Image image = imageIcon.getImage().getScaledInstance(255, 255,Image.SCALE_SMOOTH);
        ImageIcon imageIcon1 = new ImageIcon(image);
        JLabel label = new JLabel(imageIcon1);
        label.setBounds(550,150,200,200);
        panel.add(label);

        JLabel labelName = new JLabel("NEW PATIENT FORM");
        labelName.setBounds(118,11,260,53); 
        labelName.setForeground(Color.WHITE);
        labelName.setFont(new Font("Arial", Font.BOLD, 20));
        panel.add(labelName);


        JLabel labelID = new JLabel("ID:");
        labelID.setBounds(35,76,200,14); 
        labelID.setFont(new Font("Arial", Font.BOLD, 14));
        labelID.setForeground(Color.white);
        panel.add(labelID);


        comboBox = new JComboBox(new String[]{"Aadhar Card", "Voter ID", "Driving License"});
        comboBox.setBounds(271, 73, 200, 30); // Increased width and height for better visibility
        comboBox.setBackground(Color.WHITE);
        comboBox.setForeground(Color.BLACK);
        comboBox.setFont(new Font("Arial", Font.BOLD, 14));
        panel.setLayout(null); // Ensure layout is set to null for absolute positioning
        panel.add(comboBox);

        JLabel labelNumber= new JLabel("Number :");
        labelNumber.setBounds(35,111,200,14); 
        labelNumber.setFont(new Font("Arial", Font.BOLD, 14));
        labelNumber.setForeground(Color.white);
        panel.add(labelNumber);


        textFieldNumber = new JTextField();
        textFieldNumber.setBounds(271, 111, 150, 20);
        panel.add(textFieldNumber);

        
        JLabel labelNumber1= new JLabel("Name :");
        labelNumber1.setBounds(35,151,200,14); 
        labelNumber1.setFont(new Font("Arial", Font.BOLD, 14));
        labelNumber1.setForeground(Color.white);
        panel.add(labelNumber1);


        textName = new JTextField();
        textName.setBounds(271, 151, 150, 20);
        panel.add(textName);



        JLabel labelGender= new JLabel("Gender:");
        labelGender.setBounds(35,191,200,14); 
        labelGender.setFont(new Font("Arial", Font.BOLD, 14));
        labelGender.setForeground(Color.white);
        panel.add(labelGender);

        r1 = new JRadioButton("Male");
        r1.setFont(new Font("Arial", Font.BOLD, 14));
        r1.setForeground(Color.white);
        r1.setBackground(new Color(109,164,170));
        r1.setBounds(271, 191, 80, 12);
        panel.add(r1);


        r2 = new JRadioButton("Female");
        r2.setFont(new Font("Arial", Font.BOLD, 14));
        r2.setForeground(Color.white);
        r2.setBackground(new Color(109,164,170));
        r2.setBounds(350, 189, 100, 15);
        panel.add(r2);


        JLabel labelDisease= new JLabel("Disease :");
        labelDisease.setBounds(35,231,200,14); 
        labelDisease.setFont(new Font("Arial", Font.BOLD, 14));
        labelDisease.setForeground(Color.white);
        panel.add(labelDisease);


        textFieldDisease= new JTextField();
        textFieldDisease.setBounds(271, 231, 150, 20);
        panel.add(textFieldDisease);

        JLabel labelRoom= new JLabel("Room :");
        labelRoom.setBounds(35,274,200,14); 
        labelRoom.setFont(new Font("Arial", Font.BOLD, 14));
        labelRoom.setForeground(Color.white);
        panel.add(labelRoom);

        ///Room choice///
        c1 = new Choice();
        try{
            conn c = new conn();
            ResultSet resultSet = c.statement.executeQuery("select * from room");
            while (resultSet.next()) {
                c1.add(resultSet.getString("room_no"));
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        c1.setBounds(271,274,170,20); 
        c1.setFont(new Font("Arial", Font.BOLD, 14));
        c1.setForeground(Color.BLACK);
        c1.setBackground(Color.white);
        panel.add(c1);


        JLabel labelDate= new JLabel("Time :");
        labelDate.setBounds(35,316,200,14); 
        labelDate.setFont(new Font("Arial", Font.BOLD, 14));
        labelDate.setForeground(Color.white);
        panel.add(labelDate);


        Date date1 = new Date();
        date = new JLabel(""+date1);
        date.setBounds(271,316,250,14); 
        date.setFont(new Font("Arial", Font.BOLD, 14));
        date.setForeground(Color.white);
        panel.add(date);

        
        JLabel labelDeposite= new JLabel("Deposite :");
        labelDeposite.setBounds(35,359,200,17); 
        labelDeposite.setFont(new Font("Arial", Font.BOLD, 14));
        labelDeposite.setForeground(Color.white);
        panel.add(labelDeposite);

        textFieldDeposite= new JTextField();
        textFieldDeposite.setBounds(271, 359, 150, 20);
        panel.add(textFieldDeposite);

        b1 = new JButton("ADD");
        b1.setBounds(100, 430, 120, 30);
        b1.setFont(new Font("Arial",Font.BOLD,14));
        b1.setForeground(new Color(12, 119, 198));
        b1.setBackground(Color.WHITE);
        b1.addActionListener(this);
        panel.add(b1);

        b2 = new JButton("BACK");
        b2.setBounds(260, 430, 120, 30);
        b2.setFont(new Font("Arial",Font.BOLD,14));
        b2.setForeground(new Color(12, 119, 198));
        b2.setBackground(Color.WHITE);
        b2.addActionListener(this);
        panel.add(b2);



        setUndecorated(true);

        setSize(850,550);
        setLayout(null);
        setLocation(300,250);
        setVisible(true);
    }
    
@Override
public void actionPerformed(ActionEvent e) {
    if(e.getSource()==b1){
        conn c = new conn();
        String radioBTN = null;
        if(r1.isSelected()){
            radioBTN = "Male";
        }
        else if(r2.isSelected()){
            radioBTN = "Female";
        }
        String s1 = (String)comboBox.getSelectedItem();
        String s2 = textFieldNumber.getText();
        String s3 = textName.getText();
        String s4  = radioBTN;
        String s5 = textFieldDisease.getText();
        String s6 = c1.getSelectedItem();
        String s7 = date.getText();
        String s8 = textFieldDeposite.getText();


        try {

            String q ="insert into Patient_Info values ('"+s1+"', '"+s2+"','"+s3+"','"+s4+"', '"+s5+"', '"+s6+"', '"+s7+"', '"+s8+"')";
            String q1 = "update room set Availability = 'Occupied' where room_no = "+s6;
            c.statement.executeUpdate(q);
            c.statement.executeUpdate(q1);
            JOptionPane.showMessageDialog(null, "Patient Added Successfully");
            setVisible(false);

        }catch (Exception E) {
            E.printStackTrace();
        }
    }else {
        setVisible(false);
    }


}



public static void main (String[]args){
    new NEW_PATIENT();
}
}

