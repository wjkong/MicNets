using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Security.Cryptography;

namespace MicNets.BizLogic
{
    /// <summary>
    /// This class uses a symmetric key algorithm (Rijndael/AES) to encrypt and 
    /// decrypt data. As long as encryption and decryption routines use the same
    /// parameters to generate the keys, the keys are guaranteed to be the same.
    /// The class uses static functions with duplicate code to make it easier to
    /// demonstrate encryption and decryption logic. In a real-life application, 
    /// this may not be the most efficient way of handling encryption, so - as
    /// soon as you feel comfortable with it - you may want to redesign this class.
    /// </summary>
    public class SecurityGuard
    {
        
		/// <summary>
		/// Static constructor initializes following static fields
		/// </summary>
		/// <param name="passPhrase">
		/// Passphrase from which a pseudo-random password will be derived. The
		/// derived password will be used to generate the encryption key.
		/// Passphrase can be any string. In this example we assume that this
		/// passphrase is an ASCII string.
		/// </param>
		/// <param name="saltValue">
		/// Salt value used along with passphrase to generate password. Salt can
		/// be any string. In this example we assume that salt is an ASCII string.
		/// </param>
		/// <param name="hashAlgorithm">
		/// Hash algorithm used to generate password. Allowed values are: "MD5" and
		/// "SHA1". SHA1 hashes are a bit slower, but more secure than MD5 hashes.
		/// </param>
		/// <param name="passwordIterations">
		/// Number of iterations used to generate password. One or two iterations
		/// should be enough.
		/// </param>
		/// <param name="initVector">
		/// Initialization vector (or IV). This value is required to encrypt the
		/// first block of plaintext data. For RijndaelManaged class IV must be 
		/// exactly 16 ASCII characters long.
		/// </param>
		/// <param name="keySize">
		/// Size of encryption key in bits. Allowed values are: 128, 192, and 256. 
		/// Longer keys are more secure than shorter keys.
		/// </param>
		static void DACCipher()
		{
			// Convert strings into byte arrays.
			// Let us assume that strings only contain ASCII codes.
			// If strings include Unicode characters, use Unicode, UTF7, or UTF8 
			// encoding.
			initVectorBytes = Encoding.Default.GetBytes( "45h3#4k534j523SH" ); // must be 16 bytes
			saltValueBytes  = Encoding.Default.GetBytes( "2A3g23i$&!" );
        
			// First, we must create a password, from which the key will be derived.
			// This password will be generated from the specified passphrase and 
			// salt value. The password will be created using the specified hash 
			// algorithm. Password creation can be done in several iterations.
			password = new PasswordDeriveBytes( "34^hFwdfG3U8m445h$3", saltValueBytes, "MD5", 2 );
        
			// Use the password to generate pseudo-random bytes for the encryption
			// key. Specify the size of the key in bytes (instead of bits).
			keyBytes = password.GetBytes( keySize / 8 );
        
			// Create uninitialized Rijndael encryption object.
			symmetricKey = new RijndaelManaged();
        
			// It is reasonable to set encryption mode to Cipher Block Chaining
			// (CBC). Use default options for other symmetric key parameters.
			symmetricKey.Mode = CipherMode.CBC;        
        
			// Generate encryptor from the existing key bytes and initialization 
			// vector. Key size will be defined based on the number of the key 
			// bytes.
			encryptor = symmetricKey.CreateEncryptor( keyBytes, initVectorBytes );
        
			// Generate decryptor from the existing key bytes and initialization 
			// vector. Key size will be defined based on the number of the key 
			// bytes.
			decryptor = symmetricKey.CreateDecryptor( keyBytes, initVectorBytes );
		}

		/// <summary>
		/// Encrypts specified plaintext using Rijndael symmetric key algorithm
		/// and returns a base64-encoded result.
		/// </summary>
		/// <param name="plainText">Plaintext value to be encrypted</param>
		/// <returns>Encrypted value formatted as a base64-encoded string</returns>
		public static string Encrypt( string plainText )
		{
			// Convert our plaintext into a byte array.
			// Let us assume that plaintext contains UTF8-encoded characters.
			byte[] plainTextBytes  = Encoding.UTF8.GetBytes( plainText );
        
			// Define memory stream which will be used to hold encrypted data.
			MemoryStream memoryStream = new MemoryStream();        
                
			// Define cryptographic stream (always use Write mode for encryption).
			CryptoStream cryptoStream = new CryptoStream( memoryStream, encryptor, CryptoStreamMode.Write );
			// Start encrypting.
			cryptoStream.Write( plainTextBytes, 0, plainTextBytes.Length );
                
			// Finish encrypting.
			cryptoStream.FlushFinalBlock();

			// Convert our encrypted data from a memory stream into a byte array.
			byte[] cipherTextBytes = memoryStream.ToArray();
                
			// Close both streams.
			memoryStream.Close();
			cryptoStream.Close();
        
			// Convert encrypted data into a base64-encoded string.
			return Convert.ToBase64String( cipherTextBytes );
		}
    
		/// <summary>
		/// Decrypts specified ciphertext using Rijndael symmetric key algorithm.
		/// </summary>
		/// <param name="cipherText">Base64-formatted ciphertext value</param>
		/// <returns>Decrypted string value</returns>
		/// <remarks>
		/// Most of the logic in this function is similar to the Encrypt
		/// logic. In order for decryption to work, all parameters of this function
		/// - except cipherText value - must match the corresponding parameters of
		/// the Encrypt function which was called to generate the
		/// ciphertext.
		/// </remarks>
		public static string Decrypt( string cipherText )
		{
			string plainText = null;
			MemoryStream  memoryStream = null;
			CryptoStream  cryptoStream = null;

			try
			{
				// Convert our ciphertext into a byte array.
				byte[] cipherTextBytes = Convert.FromBase64String( cipherText );
	        
				// Define memory stream which will be used to hold encrypted data.
				memoryStream = new MemoryStream( cipherTextBytes );
	                
				// Define cryptographic stream (always use Read mode for encryption).
				cryptoStream = new CryptoStream( memoryStream, decryptor, CryptoStreamMode.Read );

				// Since at this point we don't know what the size of decrypted data
				// will be, allocate the buffer long enough to hold ciphertext;
				// plaintext is never longer than ciphertext.
				byte[] plainTextBytes = new byte[cipherTextBytes.Length];
        
				// Start decrypting.
				int decryptedByteCount = cryptoStream.Read( plainTextBytes, 0, plainTextBytes.Length );
				// Convert decrypted data into a string. 
				// Let us assume that the original plaintext string was UTF8-encoded.
				plainText = Encoding.UTF8.GetString( plainTextBytes, 0, decryptedByteCount );

				memoryStream.Close();
				cryptoStream.Close();
			}
			catch( Exception e )
			{
				System.Diagnostics.Debug.WriteLine( e.Message );
				plainText = cipherText;
			}
        
			return plainText;
		}


		/// <summary>
		/// Private static fields
		/// </summary>
		
		private static byte[]				initVectorBytes;
		private static byte[]				saltValueBytes;
		private static PasswordDeriveBytes	password;
		private static byte[]				keyBytes;
		private static RijndaelManaged		symmetricKey;
		private static ICryptoTransform		encryptor;
		private static ICryptoTransform		decryptor;
		private static int					keySize = 128; // can be 192 or 128
    }
}
