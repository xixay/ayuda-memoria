- [1. Crear componente en proyecto base react mui IMANOL](#1-crear-componente-en-proyecto-base-react-mui-imanol)

# 1. Crear componente en proyecto base react mui IMANOL
- Usar el codigo base de abajo, llamarlo ejm(FormCheckbox.tsx), ubicado common/components/ui/form
```tsx
import TextField from '@mui/material/TextField'
import { Controller } from 'react-hook-form'
import Typography from '@mui/material/Typography'
import { RegisterOptions } from 'react-hook-form/dist/types/validator'
import { InputProps as StandardInputProps } from '@mui/material/Input/Input'
import { FormHelperText, IconButton, InputAdornment } from '@mui/material'
import ClearOutlined from '@mui/icons-material/ClearOutlined'
import { Variant } from '@mui/material/styles/createTypography'
import { InputHTMLAttributes, useState } from 'react'
import Visibility from '@mui/icons-material/Visibility'
import VisibilityOff from '@mui/icons-material/VisibilityOff'

export interface FormInputTextProps {
  id: string
  name: string
  control: any // TODO: Cambiar a tipo TFieldValues con tipo genérico
  label: string
  size?: 'small' | 'medium'
  type?: InputHTMLAttributes<unknown>['type']
  rules?: RegisterOptions
  disabled?: boolean
  onChange?: StandardInputProps['onChange']
  onEnter?: () => void
  onClear?: () => void
  variant?: 'standard' | 'outlined' | 'filled'
  rows?: number
  multiline?: boolean
  bgcolor?: string
  labelVariant?: Variant
  placeholder?: string
}

export const FormCheckbox = ({
  id,
  name,
  control,
  label,
  size = 'small',
  type,
  rules,
  disabled,
  onChange,
  onEnter,
  onClear,
  variant,
  rows = 1,
  multiline = false,
  bgcolor,
  labelVariant = 'subtitle2',
  placeholder = '',
}: FormInputTextProps) => {
  // Add these variables to your component to track the state
  const [showPassword, setShowPassword] = useState(false)
  const handleClickShowPassword = () => setShowPassword(!showPassword)
  const handleMouseDownPassword = () => setShowPassword(!showPassword)

  return (
    <div>
      <Typography
        variant={labelVariant}
        sx={{ fontWeight: 'fontWeightMedium' }}
      >
        {label}
      </Typography>
      <Controller
        name={name}
        control={control}
        render={({ field, fieldState: { error } }) => (
          <>
          //******Aqui pegar un componente de mui***************
            <Checkbox
              checked={!!field.value}
              onChange={field.onChange}
            />
          //****************************************************
            {!!error && <FormHelperText error>{error?.message}</FormHelperText>}
          </>
        )}
        defaultValue={''}
        rules={rules}
      />
    </div>
  )
}

```
- importar desde module/admin/openvox/ui
```tsx
import { FormCheckbox } from '../../../../common/components/ui/form/FormCheckbox'
```
- Agregarlo en el return
```tsx
<FormCheckbox id ='https' control={control} name='https' label='https'></FormCheckbox>
```
