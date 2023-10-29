function New-Password
{
    param
    (
        # The length of the password to be generated
        [Parameter(Mandatory=$true)]
        [int32]$length,

        [Parameter(Mandatory=$false)]
        [switch]$NoSpecial
    )

    $specchar_array = 33..47
    $specchar_array += 58..64
    $specchar_array += 91..96
    $specchar_array += 123..126

    $password = @()

    for ($i = 0; $i -lt $length; $i++)
    {            
        $number = Get-Random -Minimum 48 -Maximum 57
        $capletter = Get-Random -Minimum 65 -Maximum 90
        $lowletter = Get-Random -Minimum 97 -Maximum 122
        $specchar = $specchar_array | Get-Random

        if ($NoSpecial)
        {
            $pw_chars = [char]$number,[char]$capletter,[char]$lowletter

            $random_char = $pw_chars | Get-Random

            [string]$password += $random_char
        }

        else
        {
            $pw_chars = [char]$number,[char]$capletter,[char]$lowletter,[char]$specchar

            $random_char = $pw_chars | Get-Random

            [string]$password += $random_char
        }
    }

    return [string]$password
}

$my_password = New-Password -length 15 -NoSpecial

Write-Host "Generated password: $my_password"