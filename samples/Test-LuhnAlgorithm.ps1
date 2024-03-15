function Test-LuhnAlgorithm {
    [CmdletBinding()]
    param (
        [string]$Number
    )

    $digits = [char[]]$number | ForEach-Object {$_ - 48}

    $result = for ($i = $digits.Length - 2; $i -ge 0; $i--) {
        $digit = $digits[$i]
        if ($i % 2 -eq 0) {
            $digit *= 2
            if ($digit -gt 9) {
                $digit -= 9
            }
        }
        $digit
    }

    $sum = $result | Measure-Object -Sum | Select-Object -ExpandProperty Sum

    if (10 - $sum % 10 -eq $digits[-1]) {
        $true
    } else {
        $false
    }

}