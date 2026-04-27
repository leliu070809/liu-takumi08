package vn.com.vti.springexam.sevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.com.vti.springexam.entity.Members;
import vn.com.vti.springexam.entity.MembersExample;
import vn.com.vti.springexam.mapper.MembersMapper;

@Service
public class LoginSevice {

    @Autowired
    private MembersMapper memberMapper;

    public Members checkLoginByUsername(String username) {
        MembersExample membersExample = new MembersExample();
        membersExample.createCriteria().andUsernameEqualTo(username);
        List<Members> member = memberMapper.selectByExample(membersExample);

        if (member == null || member.isEmpty()) {
            return null;
        }
        return member.get(0);
    }
}

