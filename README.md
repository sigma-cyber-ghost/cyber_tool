--------------------------------------------Black Hat Web Scanner---------------------------------------------------

--------------Overview---------------------------
The Black Hat Web Scanner is a powerful and user-friendly graphical user interface (GUI) tool designed for web vulnerability scanning. Built using Python and the customtkinter library, this tool provides an intuitive interface for security professionals and enthusiasts to identify potential vulnerabilities in web applications. The scanner leverages the capabilities of Wapiti, a well-known web application vulnerability scanner, to perform comprehensive scans and report findings in real-time.

---------------Features---------------------------
User -Friendly Interface: The application features a sleek, dark-themed GUI that is easy to navigate, making it accessible for both beginners and experienced users.
Real-Time Scanning: Users can initiate scans on specified URLs and view the output in real-time, allowing for immediate feedback on the scanning process.
Matrix Animation Effect: The tool includes a visually appealing "Matrix" animation that enhances the user experience while the scan is in progress.
Error Handling: The application provides informative error messages if the Wapiti scanner is not installed or if any unexpected issues arise during the scanning process.

----------How It Works---------------------------

Input Target URL: Users enter the target URL they wish to scan, ensuring it includes the appropriate protocol (http:// or https://).
Start Scan: Upon clicking the "Start Scan" button, the tool initiates a Wapiti scan in a separate thread, preventing the GUI from freezing during the process.
Output Display: The results of the scan are displayed in a dedicated output textbox, providing users with insights into potential vulnerabilities and issues found on the target website.
Matrix Animation: While the scan is running, a dynamic matrix animation runs in the background, adding a unique visual element to the application.
Installation
To use the Black Hat Web Scanner, follow these steps:

Prerequisites: Ensure you have Python installed on your system.
Install Required Libraries: Use pip to install the necessary libraries:

Command: pip install customtkinter wapiti3

Run the Application: Save the provided code in a Python file (Cyber_Tool.py) and execute it:

Command: python3 Cyber_Tool.py

Usage
Launch the application and enter the target URL in the provided input field.
Click the "Start Scan" button to begin the scanning process.
Monitor the output textbox for real-time updates on the scan results.
Important Note
The Black Hat Web Scanner is intended for educational and ethical hacking purposes only. Users should only scan websites they own or have explicit permission to test. Unauthorized scanning can lead to legal consequences and is against ethical hacking practices.

Conclusion
The Black Hat Web Scanner is a versatile tool for anyone interested in web security. With its easy-to-use interface and powerful scanning capabilities, it serves as an excellent resource for identifying vulnerabilities and enhancing the security posture of web applications.
