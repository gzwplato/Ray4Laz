{*********************************************************************************************
*
*   raymath  - Math functions to work with Vector3, Matrix and Quaternions
*
*   CONFIGURATION:
*
*   #define RAYMATH_IMPLEMENTATION
*       Generates the implementation of the library into the included file.
*       If not defined, the library is in header only mode and can be included in other headers
*       or source files without problems. But only ONE file should hold the implementation.
*
*   #define RAYMATH_HEADER_ONLY
*       Define static inline functions code, so #include header suffices for use.
*       This may use up lots of memory.
*
*   #define RAYMATH_STANDALONE
*       Avoid raylib.h header inclusion in this file.
*       Vector3 and Matrix data types are defined internally in raymath module.
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2015-2021 Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************}
unit ray_math;

interface

uses ray_header;

type
    TFloat3 = record
        f1 : Single;
        f2 : Single;
        f3 : Single;
    end;

    TFloat16 = record
        f1 : single;
        f2 : single;
        f3 : single;
        f4 : single;
        f5 : single;
        f6 : single;
        f7 : single;
        f8 : single;
        f9 : single;
        f10 : single;
        f11 : single;
        f12 : single;
        f13 : single;
        f14 : single;
        f15 : single;
        f16 : single;
    end;

//----------------------------------------------------------------------------------
// Module Functions Definition - Utils math
//----------------------------------------------------------------------------------

function  Clamp(aValue, aMin, aMax : Single): Single; cdecl; external cDllName;   // Clamp float value
function  Lerp(aStart, aEnd, aAmount : Single): Single; cdecl; external cDllName; // Calculate linear interpolation between two floats
function  Normalize(aValue, aStart, aEnd: Single): Single; cdecl; external cDllName; // Normalize input value within input range
function  Remap(aValue, aInputStart, aInputEnd, aOutputStart, aOutputEnd : Single): Single; cdecl; external cDllName;// Remap input value within input range to output range

//----------------------------------------------------------------------------------
// Module Functions Definition - Vector2 math
//----------------------------------------------------------------------------------

function  Vector2Zero(): TVector2; cdecl; external cDllName;// Vector with components value 0.0
function  Vector2One(): TVector2; cdecl; external cDllName;// Vector with components value 1.0
function  Vector2Add(aV1, aV2 : TVector2): TVector2; cdecl; external cDllName;// Add two vectors (v1 + v2)
function  Vector2AddValue(aV: TVector2; aAdd: Single): TVector2;cdecl; external cDllName; // Add vector and float value
function  Vector2Subtract(aV1, aV2 : TVector2): TVector2; cdecl; external cDllName;// Subtract two vectors (v1 - v2)
function  Vector2SubtractValue( aV: TVector2; aSub:Single): TVector2; cdecl; external cDllName;// Subtract vector by float value
function  Vector2Length(aV : TVector2): Single; cdecl; external cDllName; // Calculate vector length
function  Vector2LengthSqr(aV : TVector2): Single; cdecl; external cDllName; // Calculate vector square length
function  Vector2DotProduct(aV1, aV2 : TVector2): Single; cdecl; external cDllName; // Calculate two vectors dot product
function  Vector2Distance(aV1, aV2 : TVector2): Single; cdecl; external cDllName;// Calculate distance between two vectors
function  Vector2Angle(aV1, aV2 : TVector2): Single; cdecl; external cDllName;// Calculate angle from two vectors in X-axis
function  Vector2Scale(aV : TVector2; aScale : Single): TVector2; cdecl; external cDllName;// Scale vector (multiply by value)
function  Vector2Multiply(aV1, aV2 : TVector2): TVector2; cdecl; external cDllName;// Multiply vector by vector
function  Vector2Negate(aV : TVector2): TVector2; cdecl; external cDllName;// Negate vector
function  Vector2Divide(aV1, aV2 : TVector2): TVector2; cdecl; external cDllName;// Divide vector by vector
function  Vector2Normalize(aV : TVector2): TVector2; cdecl; external cDllName; // Normalize provided vector
function  Vector2Lerp(aV1, aV2 : TVector2; aAmount : Single): TVector2; cdecl; external cDllName;// Calculate linear interpolation between two vectors
function  Vector2Reflect(aV, aNormal : TVector2): TVector2; cdecl; external cDllName;// Calculate reflected vector to normal
function  Vector2Rotate(aV: TVector2; aDegs:Single) :TVector2; cdecl; external cDllName;// Rotate Vector by float in Degrees.
function  Vector2MoveTowards(aV, aTarget:Tvector2; aMaxDistance: Single): TVector2; cdecl; external cDllName; // Move Vector towards target

//----------------------------------------------------------------------------------
// Module Functions Definition - Vector3 math
//----------------------------------------------------------------------------------

function  Vector3Zero(): TVector3; cdecl; external cDllName;// Vector with components value 0.0
function  Vector3One(): TVector3; cdecl; external cDllName;// Vector with components value 1.0
function  Vector3Add(aV1, aV2 : TVector3): TVector3; cdecl; external cDllName;// Add two vectors
function  Vector3AddValue(aV: Tvector3; aAdd: single): TVector3; cdecl; external cDllName; // Add vector and float value
function  Vector3Subtract(aV1, aV2 : TVector3): TVector3; cdecl; external cDllName; // Subtract two vectors
function  Vector3SubtractValue(aV: TVector3; aSub:Single): Tvector3;  cdecl; external cDllName; // Subtract two vectors
function  Vector3Scale(aV: TVector3; aScalar:Single): TVector3; cdecl; external cDllName;// Multiply vector by scalar
function  Vector3Multiply(aV1, aV2 : TVector3): TVector3; cdecl; external cDllName;// Multiply vector by vector
function  Vector3CrossProduct(aV1, aV2 : TVector3): TVector3; cdecl; external cDllName;// Calculate two vectors cross product
function  Vector3Perpendicular(aV : TVector3): TVector3; cdecl; external cDllName;// Calculate one vector perpendicular vector
function  Vector3Length(aV : TVector3): Single; cdecl; external cDllName;// Calculate vector length
function  Vector3LengthSqr(aV: TVector3): Single; cdecl; external cDllName;// Calculate vector square length
function  Vector3DotProduct(aV1, aV2 : TVector3): Single; cdecl; external cDllName;// Calculate two vectors dot product
function  Vector3Distance(aV1, aV2 : TVector3): Single; cdecl; external cDllName;// Calculate distance between two vectors
function  Vector3Negate(aV : TVector3): TVector3; cdecl; external cDllName;// Negate provided vector (invert direction)
function  Vector3Divide(aV1, aV2 : TVector3): TVector3; cdecl; external cDllName;// Divide vector by vector
function  Vector3Normalize(aV : TVector3): TVector3; cdecl; external cDllName; // Normalize provided vector
procedure Vector3OrthoNormalize(aV1, aV2 : PVector3); cdecl; external cDllName;// Orthonormalize provided vectors
function  Vector3Transform(aV : TVector3; aMat : TMatrix): TVector3; cdecl; external cDllName;// Transforms a Vector3 by a given Matrix
function  Vector3RotateByQuaternion(aV : TVector3; aQ : TQuaternion): TVector3; cdecl; external cDllName;// Transform a vector by quaternion rotation
function  Vector3Lerp(aV1, aV2 : TVector3; aAmount : Single): TVector3; cdecl; external cDllName;// Calculate linear interpolation between two vectors
function  Vector3Reflect(aV, aNormal : TVector3): TVector3; cdecl; external cDllName;// Calculate reflected vector to normal
function  Vector3Min(aV1, aV2 : TVector3): TVector3; cdecl; external cDllName;// Return min value for each pair of components
function  Vector3Max(aV1, aV2 : TVector3): TVector3; cdecl; external cDllName;// Return max value for each pair of components
function  Vector3Barycenter(aP, aA, aB, aC : TVector3): TVector3; cdecl; external cDllName;// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
function  Vector3ToFloatV(aV : TVector3): TFloat3; cdecl; external cDllName;// Returns Vector3 as float array

//----------------------------------------------------------------------------------
// Module Functions Definition - Matrix math
//----------------------------------------------------------------------------------


function  MatrixDeterminant(amat : TMatrix) : Single; cdecl; external cDllName; // Compute matrix determinant
function  MatrixTrace(mat : TMatrix): Single; cdecl; external cDllName;// Returns the trace of the matrix (sum of the values along the diagonal)
function  MatrixTranspose(amat : TMatrix): TMatrix; cdecl; external cDllName;// Transposes provided matrix
function  MatrixInvert(amat : TMatrix): TMatrix; cdecl; external cDllName; // Invert provided matrix
function  MatrixNormalize(amat : TMatrix): TMatrix; cdecl; external cDllName;// Normalize provided matrix
function  MatrixIdentity(): TMatrix; cdecl; external cDllName;// Returns identity matrix
function  MatrixAdd(aleft : TMatrix; aright : TMatrix): TMatrix; cdecl; external cDllName;// Add two matrices
function  MatrixSubtract(aleft : TMatrix; aright : TMatrix): TMatrix; cdecl; external cDllName;// Subtract two matrices (left - right)
function  MatrixMultiply(aLeft : TMatrix; aRight : TMatrix): TMatrix; cdecl; external cDllName;// Returns two matrix multiplication
function  MatrixTranslate(aX, aY, aZ : Single): TMatrix; cdecl; external cDllName;// Returns translation matrix
function  MatrixRotate(aAxis : TVector3; aAngle : Single): TMatrix; cdecl; external cDllName;// Create rotation matrix from axis and angle
function  MatrixRotateX(aAngle : Single): TMatrix; cdecl; external cDllName;// Returns x-rotation matrix (angle in radians)
function  MatrixRotateY(aAngle : Single): TMatrix; cdecl; external cDllName;// Returns y-rotation matrix (angle in radians)
function  MatrixRotateZ(aAngle : Single): TMatrix; cdecl; external cDllName;// Returns z-rotation matrix (angle in radians)
function  MatrixRotateXYZ(aAng : TVector3): TMatrix; cdecl; external cDllName;// Returns xyz-rotation matrix (angles in radians)
function  MatrixRotateZYX(aAng : TVector3): TMatrix; cdecl; external cDllName;// Returns zyx-rotation matrix (angles in radians)
function  MatrixScale(aX, aY, aZ : Single): TMatrix; cdecl; external cDllName;// Returns scaling matrix
function  MatrixFrustum(aLeft, aRight, aBottom, aTop, aNear, aFar : Double): TMatrix; cdecl; external cDllName;// Returns perspective projection matrix
function  MatrixPerspective(aFovy, aAspect, aNear, aFar : Double): TMatrix; cdecl; external cDllName;// Returns perspective projection matrix
function  MatrixOrtho(aLeft, aRight, aBottom, aTop, aNear, aFar : Double): TMatrix; cdecl; external cDllName;// Returns orthographic projection matrix
function  MatrixLookAt(aEye, aTarget, aUp : TVector3): TMatrix; cdecl; external cDllName;// Returns camera look-at matrix (view matrix)
function  MatrixToFloatV(aMat : TMatrix): TFloat16; cdecl; external cDllName; // Returns float array of matrix data

//----------------------------------------------------------------------------------
// Module Functions Definition - Quaternion math
//----------------------------------------------------------------------------------

function  QuaternionAdd(q1, q2: TQuaternion): TQuaternion; cdecl; external cDllName;// Add two quaternions
function  QuaternionAddValue(q: TQuaternion ; aAdd: single): TQuaternion; cdecl; external cDllName;// Add quaternion and float value
function  QuaternionSubtract(q1, q2: TQuaternion): TQuaternion; cdecl; external cDllName;// Subtract two quaternions
function  QuaternionSubtractValue(q:TQuaternion; aSub:single): TQuaternion; cdecl; external cDllName;// Subtract quaternion and float value
function  QuaternionIdentity(): TQuaternion; cdecl; external cDllName;// Returns identity quaternion
function  QuaternionLength(aQ : TQuaternion): Single; cdecl; external cDllName;// Computes the length of a quaternion
function  QuaternionNormalize(aQ : TQuaternion): TQuaternion; cdecl; external cDllName;// Normalize provided quaternion
function  QuaternionInvert(aQ : TQuaternion): TQuaternion; cdecl; external cDllName;// Invert provided quaternion
function  QuaternionMultiply(aQ1, aQ2 : TQuaternion): TQuaternion; cdecl; external cDllName;// Calculate two quaternion multiplication
function  QuaternionScale(q:TQuaternion;mul:single): TQuaternion; cdecl; external cDllName;// Scale quaternion by float value
function  QuaternionDivide( q1, q2: TQuaternion): TQuaternion; cdecl; external cDllName;// Divide two quaternions
function  QuaternionLerp(aQ1, aQ2 : TQuaternion; aAmount : Single): TQuaternion; cdecl; external cDllName;// Calculate linear interpolation between two quaternions
function  QuaternionNlerp(aQ1, aQ2 : TQuaternion; aAmount : Single): TQuaternion; cdecl; external cDllName;// Calculate slerp-optimized interpolation between two quaternions
function  QuaternionSlerp(aQ1, aQ2 : TQuaternion; aAmount : Single): TQuaternion; cdecl; external cDllName;// Calculates spherical linear interpolation between two quaternions
function  QuaternionFromVector3ToVector3(aFrom, aTo : TVector3): TQuaternion; cdecl; external cDllName;// Calculate quaternion based on the rotation from one vector to another
function  QuaternionFromMatrix(aMat : TMatrix): TQuaternion; cdecl; external cDllName;// Returns a quaternion for a given rotation matrix
function  QuaternionToMatrix(aQ : TQuaternion): TMatrix; cdecl; external cDllName;// Returns a matrix for a given quaternion
function  QuaternionFromAxisAngle(aAxis : TVector3; aAngle : Single): TQuaternion; cdecl; external cDllName;// Returns rotation quaternion for an angle and axis
procedure QuaternionToAxisAngle(aQ : TQuaternion; aOutAxis : PVector3; aOutAngle : PSingle); cdecl; external cDllName;// Returns the rotation angle and axis for a given quaternion
function  QuaternionFromEuler(aRoll, aPitch, aYaw : Single): TQuaternion; cdecl; external cDllName;// Returns the quaternion equivalent to Euler angles
function  QuaternionToEuler(aQ : TQuaternion): TVector3; cdecl; external cDllName;// Return the Euler angles equivalent to quaternion (roll, pitch, yaw)
function  QuaternionTransform(aQ : TQuaternion; aMat : TMatrix): TQuaternion; cdecl; external cDllName;// Transform a quaternion given a transformation matrix

// Projects a Vector3 from screen space into object space
function Vector3Unproject(source:TVector3; projection:TMatrix; view:TMatrix):TVector3; cdecl; external cDllName;

implementation

end.
