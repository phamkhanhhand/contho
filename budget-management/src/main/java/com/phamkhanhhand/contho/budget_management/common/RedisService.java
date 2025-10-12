package com.phamkhanhhand.contho.budget_management.common;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

@Service
public class RedisService {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    // Lưu object bất kỳ
    public void saveData(String key, Object value) {
        redisTemplate.opsForValue().set(key, value);
    }

    // Lấy object và ép kiểu về dạng cần dùng
    public <T> T getData(String key, Class<T> clazz) {
        Object obj = redisTemplate.opsForValue().get(key);
        if (clazz.isInstance(obj)) {
            return clazz.cast(obj);
        }
        return null;
    }

    // (Tuỳ chọn) Xoá
    public void deleteData(String key) {
        redisTemplate.delete(key);
    }
}
