function [RI]=reverse_josephus_permute(RJI,encryption_key,jump,u,v)
    % RJI: image after reverse Josephus traverse
    
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