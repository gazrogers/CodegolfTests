$Command = $args[0]
$Arguments = $args[1..($args.Count-1)]
$pass = 0
$count = 0

function run_test($Num, $Expected, $Test) {
    $result = $Test | &$Command @Arguments
    $script:count++
    if ($result -ne $Expected) {
        Write-Host -Foreground Red "Test $($Num): FAIL. Expected <$Expected>, got <$result>."
    } else {
        Write-Host -Foreground Green "Test $($Num): PASS"
        $script:pass++
    }
}

run_test 1 "YES" @"
1
6 12 5
"@

run_test 2 "YES" @"
6
1 12 3
1 12 4
1 12 1
1 12 5
1 12 3
1 12 5
"@

run_test 3 "NO" @"
1
4 3 13
"@

run_test 4 "NO" @"
1
6 12 6
"@

run_test 5 "YES" @"
5
3 2 1
3 3 4
6 1 5
1 1 4
5 4 2
"@

run_test 6 "YES" @"
8
4 3 1
1 3 5
2 4 2
3 4 4
2 1 2
2 10 5
1 8 5
2 1 5
"@

run_test 7 "NO" @"
3
2 11 3
5 6 2
6 12 5
"@

run_test 8 "NO" @"
17
6 6 3
4 11 3
5 11 4
1 10 5
3 3 4
6 12 1
5 1 5
6 3 3
2 8 3
4 11 1
1 11 5
4 4 2
2 6 4
4 10 4
4 4 4
5 6 2
4 11 3
"@

run_test 9 "NO" @"
8
6 7 4
6 6 3
4 9 3
6 4 5
2 9 2
5 4 1
3 2 2
1 2 5
"@

run_test 10 "YES" @"
4
3 4 1
1 12 3
4 7 1
2 6 5
"@

run_test 11 "YES" @"
3
2 5 1
2 5 5
5 1 3
"@

run_test 12 "YES" @"
3
5 6 5
1 11 2
6 5 5
"@

run_test 13 "YES" @"
2
2 7 5
4 10 1
"@

run_test 14 "YES" @"
3
2 4 2
6 5 5
3 7 4
"@

run_test 15 "YES" @"
72
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
"@

run_test 16 "NO" @"
73
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
"@

Write-Host $pass/$count passed.
