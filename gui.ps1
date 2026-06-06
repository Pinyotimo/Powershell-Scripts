<#
GUI Login Form in PowerShell
This script creates a Windows Form with username and password fields,
validates against predefined credentials, and displays success/failure.
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Predefined credentials
$AdminUser = "Admin"
$AdminPass = "Steve@123"

# Create the form
$form = New-Object Windows.Forms.Form
$form.Text = "System Authentication Gateway"
$form.Size = New-Object Drawing.Size(350,200)
$form.StartPosition = "CenterScreen"

# Username label
$userLabel = New-Object Windows.Forms.Label
$userLabel.Text = "Username:"
$userLabel.Location = New-Object Drawing.Point(20,20)
$form.Controls.Add($userLabel)

# Username textbox
$userBox = New-Object Windows.Forms.TextBox
$userBox.Location = New-Object Drawing.Point(120,20)
$userBox.Width = 180
$form.Controls.Add($userBox)

# Password label
$passLabel = New-Object Windows.Forms.Label
$passLabel.Text = "Password:"
$passLabel.Location = New-Object Drawing.Point(20,60)
$form.Controls.Add($passLabel)

# Password textbox (masked)
$passBox = New-Object Windows.Forms.TextBox
$passBox.Location = New-Object Drawing.Point(120,60)
$passBox.Width = 180
$passBox.UseSystemPasswordChar = $true
$form.Controls.Add($passBox)

# Login button
$loginButton = New-Object Windows.Forms.Button
$loginButton.Text = "Login"
$loginButton.Location = New-Object Drawing.Point(120,100)
$loginButton.Add_Click({
    if ($userBox.Text -eq $AdminUser -and $passBox.Text -eq $AdminPass) {
        [Windows.Forms.MessageBox]::Show("Access Granted. Welcome, $($userBox.Text)!","Login Successful",[Windows.Forms.MessageBoxButtons]::OK,[Windows.Forms.MessageBoxIcon]::Information)
    } else {
        [Windows.Forms.MessageBox]::Show("Access Denied. Invalid credentials.","Login Failed",[Windows.Forms.MessageBoxButtons]::OK,[Windows.Forms.MessageBoxIcon]::Error)
    }
})
$form.Controls.Add($loginButton)

# Cancel button
$cancelButton = New-Object Windows.Forms.Button
$cancelButton.Text = "Cancel"
$cancelButton.Location = New-Object Drawing.Point(220,100)
$cancelButton.Add_Click({ $form.Close() })
$form.Controls.Add($cancelButton)

# Show the form
$form.ShowDialog()
