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

# Test 1
Run-Test 1 @'
A B C D

B A
'@ @'
A B
B A
B C
C D
D C

A D
C A
B A
'@

# Test 2
Run-Test 2 @'
A B D
H B C F
G B I
G B H
J A I
'@ @'
A B
A E
A G
A I
B A
B C
B D
B E
B G
B H
B I
C B
C D
C E
C F
C G
C J
D A
D B
D E
D G
E A
E B
E C
E D
E G
E H
E I
E J
F C
F G
F I
G B
G D
G E
H A
H B
H D
H E
H G
H I
I B
I E
I G
J A
J B
J C
J E
J G

A D
H F
G I
G H
J I
'@

# Test 3
Run-Test 3 @'
A C E F H

H G F

A C D
'@ @'
A B
A C
B A
C D
C E
D B
D E
E B
E C
E D
E F
F H
F G
G F
G H
H G

A H
H A
H F
F B
A D
'@

# Test 4
Run-Test 4 @'
I J H B G C A
A B G J M
L F D G C A B
A B G L
E L F D G C A B I
'@ @'
A B
A C
A D
B I
B H
B G
C A
C H
C G
C F
D G
D F
D E
E L
F D
F K
F L
G C
G J
G K
G L
H B
H J
H K
I J
J H
J M
K G
K M
L F
L M

I A
A M
L B
A L
E I
'@

# Test 5
Run-Test 5 @'
S O J K L F G
R N P B C D F M
K J O N P B
C G
H B C G I J K
'@ @'
A B
B A
B C
C D
C G
D E
D F
E D
F G
F M
G H
G I
H B
H N
I J
I L
J K
J O
K J
K L
K M
L F
M F
N P
N R
O J
O N
O S
P B
P Q
Q P
R N
S O

S G
R M
K B
C G
H K
'@

Write-Host $pass/$count passed.
