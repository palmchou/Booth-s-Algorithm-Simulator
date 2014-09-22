let multiplicand = [0, 0, 1, 1]
let multiplier = [1, 0, 0, 1]

func binaryToString(binary: [Int]) -> String {
    var out = ""
    for bit in binary {
        out.extend(bit == 1 ? "1 " : "0 ")
    }
    return out
}

func binaryAdd(binaryA: [Int], plus binaryB: [Int]) -> [Int] {
    var result = [Int](count: 4, repeatedValue: 0)
    var carry = 0
    for(var i = 3; i >= 0; i--) {
        result[i] = binaryA[i] + binaryB[i] + carry;
        switch result[i] {
        case 0, 1:
            carry = 0
        case 2:
            carry = 1
            result[i] = 0
        case 3:
            carry = 1
            result[i] = 1
        default: continue
        }
    }
    return result
}

func twosComplement(binary: [Int]) -> [Int] {
    var result = [Int](count: 4, repeatedValue: 0)
    for i in 0..<4 {
        result[i] = binary[i] == 0 ? 1 : 0
    }
    result = binaryAdd(result, plus: [0, 0, 0, 1])
    return result
}

func binarySub(binaryA: [Int], minus binaryB: [Int]) -> [Int] {
    var result = [Int](count: 4, repeatedValue: 0)
    result = binaryAdd(binaryA, plus: twosComplement(binaryB))
    return result
}

//to be implemented
class Register {
    var bits = [Int]()
    
}

// tests of functions
binaryToString(multiplier)

binaryToString(binaryAdd(multiplier, plus: multiplicand))

binaryToString(twosComplement(multiplier))

binaryToString(binarySub(multiplier, minus: multiplicand))

binaryToString(binarySub(multiplicand, minus: multiplier))
