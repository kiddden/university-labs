//
//  main.swift
//  lab7
//
//  Created by Eugene Ned on 23.05.2023.
//

import Foundation

func determineTriangleType(side1: Double, side2: Double, side3: Double) -> String {
    if (side1 <= 0 || side2 <= 0 || side3 <= 0)
        || (side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1) {
        // No side can be zero, nor the sum of two sides can be smaller or equal than the biggest side
        return "Triangle can't exist with these sides"
    } else if side1 == side2 && side2 == side3 {
        // All sides are equal
        return "Equilateral"
    } else if side1 == side2 || side1 == side3 || side2 == side3 {
        // Two sides are equal
        return "Isosceles"
    } else if side1 * side1 == side2 * side2 + side3 * side3
                || side2 * side2 == side1 * side1 + side3 * side3
                || side3 * side3 == side1 * side1 + side2 * side2 {
        // Square angle between any two sides
        return "Squared"
    } else {
        return "Scalene"
    }
}

//print("Enter sides of a triangle separated by whitespaces:")
//if let input = readLine() {
//    let sides = input.split(separator: " ").compactMap { Double($0) }
//    if sides.count == 3 {
//        let triangleType = determineTriangleType(side1: sides[0], side2: sides[1], side3: sides[2])
//        print("Your triangle is: \(triangleType)")
//    } else {
//        print("Inalid input, try again")
//    }
//} else {
//    print("Inalid input, try again")
//}

// Equivalent Partitioning Testing
func equivalentPartitioningTesting() {
    // Valid triangles
    assert(determineTriangleType(side1: 3, side2: 3, side3: 3) == "Equilateral")
    assert(determineTriangleType(side1: 5, side2: 5, side3: 8) == "Isosceles")
    assert(determineTriangleType(side1: 3, side2: 4, side3: 5) == "Squared")
    assert(determineTriangleType(side1: 6, side2: 7, side3: 8) == "Scalene")
    
    // Invalid triangles
    assert(determineTriangleType(side1: 0, side2: 3, side3: 4) == "Triangle can't exist with these sides")
    assert(determineTriangleType(side1: 2, side2: 3, side3: 6) == "Triangle can't exist with these sides")
}

// Boundary Value Testing
func boundaryValueTesting() {
    // Valid triangles
    assert(determineTriangleType(side1: 1, side2: 1, side3: 1) == "Equilateral")
    assert(determineTriangleType(side1: 2, side2: 2, side3: 3) == "Isosceles")
    assert(determineTriangleType(side1: 3, side2: 4, side3: 5) == "Squared")
    
    // Invalid triangles
    assert(determineTriangleType(side1: 0, side2: 1, side3: 1) == "Triangle can't exist with these sides")
    assert(determineTriangleType(side1: 2, side2: 3, side3: 5) == "Triangle can't exist with these sides")
}

// Cause-Effect Testing
func causeEffectTesting() {
    // Valid triangles
    
    // Cause: All sides are equal
    assert(determineTriangleType(side1: 1, side2: 1, side3: 1) == "Equilateral")
    // Cause: Two sides are equal
    assert(determineTriangleType(side1: 3, side2: 3, side3: 5) == "Isosceles")
    // Cause: Pythagorean theorem holds
    assert(determineTriangleType(side1: 3, side2: 4, side3: 5) == "Squared")
    
    // Invalid triangles
    
    // Cause: Zero side length
    assert(determineTriangleType(side1: 0, side2: 3, side3: 4) == "Triangle can't exist with these sides")
    // Cause: Sum of two sides is smaller than the third side
    assert(determineTriangleType(side1: 2, side2: 3, side3: 6) == "Triangle can't exist with these sides")
}

// Run tests
equivalentPartitioningTesting()
boundaryValueTesting()
causeEffectTesting()

// We get here only if all tests passed
print("All tests passed.")

