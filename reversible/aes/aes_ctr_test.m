pth = {'6b' 'c1' 'be' 'e2' '2e' '40' '9f' '96'...
    'e9' '3d' '7e' '11' '73' '93' '17' '2a'...
    'ae' '2d' '8a' '57' '1e' '03' 'ac' '9c'...
    '9e' 'b7' '6f' 'ac' '45' 'af' '8e' '51'...
    '30' 'c8' '1c' '46' 'a3' '5c' 'e4' '11'...
    'e5' 'fb' 'c1' '19' '1a' '0a' '52' 'ef'...
    'f6' '9f' '24' '45' 'df' '4f' '9b' '17'...
    'ad' '2b' '41' '7b' 'e6' '6c' '37' '10'};
% 明文长度必须为16的倍数
pt = hex2dec(pth);

% ctr模式下，密钥必须128位长
keyh = {'2b' '7e' '15' '16' '28' 'ae' 'd2' 'a6'...
    'ab' 'f7' '15' '88' '09' 'cf' '4f' '3c'};
key = hex2dec(keyh);

s = aesinit(key);

%  CTR test of AES-128

ct = aes(s, 'enc', 'ctr', pt);
pt2 = aes(s, 'dec', 'ctr', ct);

% ctcheckh = {'87' '4d' '61' '91' 'b6' '20' 'e3' '26'...
%     '1b' 'ef' '68' '64' '99' '0d' 'b6' 'ce'...
%     '98' '06' 'f6' '6b' '79' '70' 'fd' 'ff'...
%     '86' '17' '18' '7b' 'b9' 'ff' 'fd' 'ff'...
%     '5a' 'e4' 'df' '3e' 'db' 'd5' 'd3' '5e'...
%     '5b' '4f' '09' '02' '0d' 'b0' '3e' 'ab'...
%     '1e' '03' '1d' 'da' '2f' 'be' '03' 'd1'...
%     '79' '21' '70' 'a0' 'f3' '00' '9c' 'ee'};
% ctcheck = hex2dec(ctcheckh);

% test ciphertext & decrypted plaintext
fprintf('CTR - Ciphertext errors: %d, plaintext errors: %d.\n',...
    sum(pt(:) ~= pt2(:)));