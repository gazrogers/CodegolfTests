$Command = $args[0]
$Arguments = $args[1..($args.Count-1)]
$pass = 0
$count = 0

function Run-Test($Num, $Expected, $Test) {
    $result = @($Test | &$Command @Arguments) -join "`n"
    $script:count++
    if (($result -replace ' +(?=\n|$)') -cne ($Expected -replace ' +(?=\n|$)')) {
        Write-Host -Foreground Red "Test $($Num): FAIL. Input:`n$Test`nExpected:`n$Expected`nGot:`n$result"
    } else {
        Write-Host -Foreground Green "Test $($Num): PASS"
        $script:pass++
    }
}

# Test 1 - Major inversions
Run-Test 1 @'
C E G
C G E
E C G
E G C
G E C
G C E
'@ @'
Major
Major
Major
Major
Major
Major
'@

# Test 2 - Minor inversions
Run-Test 2 @'
Ab Cb Eb
Ab Eb Cb
Cb Eb Ab
Cb Ab Eb
Eb Ab Cb
Eb Cb Ab
'@ @'
Minor
Minor
Minor
Minor
Minor
Minor
'@

# Test 3 - Invalid chords
Run-Test 3 @'
A B C
D E F
A# C# G
Fb C# D
C# C# C#
C F# G
'@ @'






'@

# Test 4 - Enharmonic equivalents and their inversions
Run-Test 4 @'
C Eb G
C D# G
C G Eb
C G D#
G Eb C
G D# C
G C Eb
G C D#
Eb C G
D# C G
Eb G C
D# G C
C E G
C Fb G
C G E
C G Fb
G E C
G Fb C
G C E
G C Fb
E C G
Fb C G
E G C
Fb G C
'@ @'
Minor
Minor
Minor
Minor
Minor
Minor
Minor
Minor
Minor
Minor
Minor
Minor
Major
Major
Major
Major
Major
Major
Major
Major
Major
Major
Major
Major
'@

# Test 5 - Random stuff
Run-Test 5 @'
C E G
F Ab C
C Eb Gb
E G B
Db F Ab
Bb G D
D A Gb
G# Cb Eb
C# Gb A
D# F# A
Eb Gb A
A F# Eb
'@ @'
Major
Minor

Minor
Major
Minor
Major
Minor
Minor



'@

Write-Host $pass/$count passed.
