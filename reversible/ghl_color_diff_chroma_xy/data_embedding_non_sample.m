function [AI1,num1,interp_l,interp_r]=data_embedding_non_sample(I,IP,add_bits)
    % embed bits into non-sample pixels
    I=double(I);    
    [m,n]=size(I);    
    
    d_interp=I-IP;
    ind=1;
    
    for i=1:2:m
        for j=1:2:n
            d_interp(i,j)=300;
        end        
    end
    
    [interp_l,interp_r]=find_two_peaks(d_interp(d_interp~=300));% left peak and right peak of non-sample pixels
    
    modify_d_interp=d_interp;
    
    for i=1:m
        for j=1:n
            if mod(i,2)==1 && mod(j,2)==1
                continue;
            end
            if d_interp(i,j)>interp_r
                modify_d_interp(i,j)=d_interp(i,j)+1;
            else if d_interp(i,j)<interp_l
                    modify_d_interp(i,j)=d_interp(i,j)-1;
                else
                    if d_interp(i,j)==interp_l
                        modify_d_interp(i,j)=d_interp(i,j)+(-1)*add_bits(ind);
                        ind=ind+1;
                    else if d_interp(i,j)==interp_r
                            modify_d_interp(i,j)=d_interp(i,j)+add_bits(ind);
                            ind=ind+1;
                        end
                        % pixel q whose value interp_l < q < interp_r is not modified
                    end
                end
            end
        end
    end    
    
    modify_d_interp(modify_d_interp==300)=0;
    AI1=modify_d_interp+IP;
    
%     % embed bits into reference pixels
%     % 需要修改，不同于A New Reversible Data Hiding Scheme with Improved Capacity 
%     % Based on Directional Interpolation and Difference Expansion
%     % 使用 周围的embeddable pixels来对reference pixels插值
%     if mod(m,2)==0
%        ref_ver_max=m-1;
%     else
%        ref_ver_max=m;
%     end
%     if mod(n,2)==0
%         ref_hor_max=n-1;
%     else
%         ref_hor_max=n-2;
%     end
%     
%     d_ref=ones(m,n)*300;
%     for i=1:2:ref_ver_max
%         for j=1:2:ref_hor_max
%             d_ref(i,j)=I(i,j)-AI(i,j+1);% the same as AI(i,j)-AI(i,j+1)
%         end
%     end
%     
%     [ref_l,ref_r]=find_two_peaks(d_ref(d_ref~=300));% left peak and right peak of sample pixels
%     modify_d_ref=d_ref;
%     for i=1:2:ref_ver_max
%         for j=1:2:ref_hor_max
%             if d_ref(i,j)>ref_r
%                 modify_d_ref(i,j)=d_ref(i,j)+1;
%             else if d_ref(i,j)<ref_l
%                     modify_d_ref(i,j)=d_ref(i,j)-1;
%                 else
%                     if d_ref(i,j)==ref_l
%                         modify_d_ref(i,j)=d_ref(i,j)+(-1)*add_bits(ind);
%                         ind=ind+1;
%                     else if d_ref(i,j)==ref_r
%                             modify_d_ref(i,j)=d_ref(i,j)+add_bits(ind);
%                             ind=ind+1;
%                         end
%                     end                    
%                 end
%             end
%         end
%     end
%     
%     
%     for i=1:2:ref_ver_max
%         for j=1:2:ref_hor_max
%             AI(i,j)=AI(i,j+1)+modify_d_ref(i,j);
%         end
%     end
    
    num1=ind-1;
    
    
end