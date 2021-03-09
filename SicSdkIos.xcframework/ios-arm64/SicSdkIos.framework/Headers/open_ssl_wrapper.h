//
//  open_ssl_wrapper.h
//  SignersInteractionComponent
//
//  Created by SergeyBrazhnik on 01.10.2020.
//  Copyright © 2020 Sander Dijkhuis. All rights reserved.
//

#ifndef open_ssl_wrapper_h
#define open_ssl_wrapper_h

#include <stdio.h>

int aes_cfb8_nopadding(
        const unsigned char aeskey[],
        const unsigned char iv[],
        const unsigned char body[],
        int body_length,
        unsigned char out[]);

char* rsa_ecb_OAEPWithSha1AndMGF1Padding(
        const unsigned char * ceisk_pem,
        const unsigned char body[],
        size_t body_length,
        size_t * out_length);

int verify_signature(
        const char* csisk_pem,
        const unsigned char* data,
        size_t len,
        const unsigned char* signature,
        size_t  signature_len);

char* decrypt_sap_response(
        const unsigned char * csisk_pem,
        const unsigned char* nonce,
        const int nonce_len,
        const unsigned char* buf,
        size_t len,
        int *out_len);

int gcm_decrypt(const unsigned char *ciphertext, int ciphertext_len,
        const unsigned char *tag,
        const unsigned char *key,
        const unsigned char *iv, int iv_len,
        unsigned char *plaintext);

int hkdf(
        unsigned char *key,
        int keylen,
        unsigned char *salt,
        int saltlen,
        unsigned char *out,
        size_t *outlen);


#endif /* open_ssl_wrapper_h */
