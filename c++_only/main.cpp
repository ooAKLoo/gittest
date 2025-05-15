//
//  main.cpp
//  c++_only
//
//  Created by 杨东举 on 2025/5/3.
//

#include <iostream>

// 定义一些常量（相当于你代码中的枚举）
const int CMD_SET_DIAG = 0x59;
const int CMD_ID_MODE_SWITCH = 0x1;
const int CMD_ID_CAPABILITY = 0x2;

// 基础模板类
template<int version_t, int cmd_set_t, int cmd_id_t>
class BaseRequest {
public:
    int version;
    int cmd_set;
    int cmd_id;
    
    BaseRequest() {
        // 构造函数中，使用模板参数给成员变量赋值
        version = version_t;    // 编译时已知的值
        cmd_set = cmd_set_t;    // 编译时已知的值
        cmd_id = cmd_id_t;      // 编译时已知的值
    }
    
    void print() {
        std::cout << "version: " << version
                  << ", cmd_set: 0x" << std::hex << cmd_set
                  << ", cmd_id: 0x" << cmd_id << std::dec << std::endl;
    }
};

// 诊断命令基础模板（固定了cmd_set为DIAG）
template<int cmd_id_t>
class DiagRequest : public BaseRequest<1, CMD_SET_DIAG, cmd_id_t> {
    //                                    ↑        ↑           ↑
    //                              版本固定为1  命令集固定   命令ID作为参数
public:
    DiagRequest() {
        // 父类构造函数已经完成了赋值
    }
};

// 具体的命令类（固定了cmd_id）
class ModeSwitchRequest : public DiagRequest<CMD_ID_MODE_SWITCH> {
    //                                              ↑
    //                                    命令ID固定为0x1
public:
    ModeSwitchRequest() {
        // 什么都不用做，值已经通过模板层层传递下来了
    }
};

// 另一个具体命令类
class CapabilityRequest : public DiagRequest<CMD_ID_CAPABILITY> {
    //                                              ↑
    //                                    命令ID固定为0x2
public:
    CapabilityRequest() {
    }
};

int main() {
    // 创建对象时，这些值已经自动填充好了
    ModeSwitchRequest mode_req;
    mode_req.print();  // 输出: version: 1, cmd_set: 0x59, cmd_id: 0x1
    
    CapabilityRequest cap_req;
    cap_req.print();   // 输出: version: 1, cmd_set: 0x59, cmd_id: 0x2
    
    return 0;
}
