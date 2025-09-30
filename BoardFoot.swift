import Foundation

// Constant for 1 board foot in cubic inches
let BoardFoot: Double = 144.0

// Error cases for invalid input
enum DataError: Error {
    case invalidInput
    case nonPositiveValue
}

// Function to calculate length
func calculateBoardFoot(width: Double, height: Double) throws -> Double {
    if width <= 0 || height <= 0 {
        throw DataError.nonPositiveValue
    }
    return BoardFoot / (width * height)
}

// Main program function
func main() {
    // Ask for width
    print("Enter the width of the board (in inches):")
    if let widthInput = readLine(),
       let width = Double(widthInput) {
        
        // Ask for height
        print("Enter the height of the board (in inches):")
        if let heightInput = readLine(),
           let height = Double(heightInput) {
            do {
                let length = try calculateBoardFoot(width: width, height: height)
                print("To make one board foot, the board must be \(length) inches long.")
            } catch DataError.nonPositiveValue {
                print("Error: Width and height must be greater than 0.")
            } catch {
                print("An unexpected error occurred: \(error)")
            }
        } else {
            print("Error: Invalid input for height.")
        }
    } else {
        print("Error: Invalid input for width.")
    }
}

// Run program
main()
