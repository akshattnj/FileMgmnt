Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'
$Image = [system.drawing.image]::FromFile("./dependencies/unnamed.jpg")
$form.BackgroundImage = $Image
$form.BackgroundImageLayout = "Stretch"
$form.FormBorderStyle = 'FixedDialog'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(70,120)
$okButton.Size = New-Object System.Drawing.Size(75,24)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.ForeColor='white'
$label.BackColor = [System.Drawing.Color]::FromName("Transparent")
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'please enter extension (without dot)'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$label2 = New-Object System.Windows.Forms.Label
$label2.ForeColor='white'
$label2.BackColor = [System.Drawing.Color]::FromName("Transparent")
$label2.Location = New-Object System.Drawing.Point(10,65)
$label2.Size = New-Object System.Drawing.Size(280,20)
$label2.Text = 'Please enter number of characters to remove'
$form.Controls.Add($label2)

$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Location = New-Object System.Drawing.Point(10,85)
$textBox2.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox2)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()
$x
if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $y = $textBox2.Text
    $x
    $y
}



get-childitem *$x | rename-item -newname { [string]($_.name).substring($y) }
$x = $null
$y = '0'