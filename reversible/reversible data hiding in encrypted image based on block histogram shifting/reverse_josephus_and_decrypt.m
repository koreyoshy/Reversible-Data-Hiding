function [RI,RJI]=reverse_josephus_and_decrypt(REI,encryption_key,jump,u,v,msb)
    % RJI: image with only Josephus traverse
    % RI: original image
    
    % decrypt with encryption_key
    RJI=encrypt_with_mMSB(REI,encryption_key,msb);
    
    % reverse Josephus traverse
    [m,n]=size(RJI); 
    hor_num=floor(m/u);
    ver_num=floor(n/v);
    
    B=1:hor_num*ver_num;
    Bp=josephus(B,jump);
    
    RI=RJI;
    len_key=length(encryption_key);
    
    for i=1:hor_num*ver_num
       ind=Bp(i);
       [x,y] = ind2sub([hor_num,ver_num],ind);
       [xi,yi] = ind2sub([hor_num,ver_num],i);
       tmp=RJI((xi-1)*u+1:xi*u,(yi-1)*v+1:yi*v);
       % permute within differendt blocks with different keys
       % different keys are generated by strcat(...)
       ptmp=reverse_permute_within_block(tmp,strcat(encryption_key,encryption_key(mod(ind,len_key)+1)));
       RI((x-1)*u+1:x*u,(y-1)*v+1:y*v)=ptmp;
    end
    
    

end